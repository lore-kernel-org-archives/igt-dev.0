Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Fri, 15 Sep 2023 12:44:36 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Message-ID: <20230915124436.08bc29db@maurocar-mobl2>
In-Reply-To: <20230908123233.137134-31-janusz.krzysztofik@linux.intel.com>
References: <20230908123233.137134-19-janusz.krzysztofik@linux.intel.com>
 <20230908123233.137134-31-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t v2 12/17] lib/ktap: Use IGT
 linked lists for storing KTAP results
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: intel-gfx@lists.freedesktop.org, igt-dev@lists.freedesktop.org,
 Isabella Basso <isabbasso@riseup.net>, intel-xe@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri,  8 Sep 2023 14:32:46 +0200
Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com> wrote:

> For code simplicity and clarity, use existing IGT linked lists library
> instead of open coding a custom implementation of a list of KTAP results.
> 
> While being at it, flatten the code by inverting a check for pending
> results.

LGTM.

Acked-by: Mauro Carvalho Chehab <mchehab@kernel.org>

> 
> Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> ---
>  lib/igt_kmod.c | 28 ++++++++++++++++------------
>  lib/igt_ktap.c | 25 +++++--------------------
>  lib/igt_ktap.h |  6 ++++--
>  3 files changed, 25 insertions(+), 34 deletions(-)
> 
> diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
> index 988ac164cb..c692954911 100644
> --- a/lib/igt_kmod.c
> +++ b/lib/igt_kmod.c
> @@ -760,7 +760,6 @@ static void __igt_kunit(struct igt_ktest *tst, const char *opts)
>  	struct kmod_module *kunit_kmod;
>  	bool is_builtin;
>  	struct ktap_test_results *results;
> -	struct ktap_test_results_element *temp;
>  	unsigned long taints;
>  	int flags, ret;
>  
> @@ -784,28 +783,33 @@ static void __igt_kunit(struct igt_ktest *tst, const char *opts)
>  		igt_skip("Unable to load %s module\n", tst->module_name);
>  	}
>  
> -	while (READ_ONCE(results->still_running) || READ_ONCE(results->head) != NULL)
> +	while (READ_ONCE(results->still_running) || !igt_list_empty(&results->list))
>  	{
> +		struct ktap_test_results_element *result;
> +
>  		if (igt_kernel_tainted(&taints)) {
>  			ktap_parser_cancel();
>  			break;
>  		}
>  
> -		if (READ_ONCE(results->head) != NULL) {
> -			pthread_mutex_lock(&results->mutex);
> +		pthread_mutex_lock(&results->mutex);
> +		if (igt_list_empty(&results->list)) {
> +			pthread_mutex_unlock(&results->mutex);
> +			continue;
> +		}
>  
> -			igt_dynamic(results->head->test_name) {
> -				igt_assert(READ_ONCE(results->head->passed));
> +		result = igt_list_first_entry(&results->list, result, link);
>  
> -				igt_fail_on(igt_kernel_tainted(&taints));
> -			}
> +		igt_list_del(&result->link);
> +		pthread_mutex_unlock(&results->mutex);
>  
> -			temp = results->head;
> -			results->head = results->head->next;
> -			free(temp);
> +		igt_dynamic(result->test_name) {
> +			igt_assert(READ_ONCE(result->passed));
>  
> -			pthread_mutex_unlock(&results->mutex);
> +			igt_fail_on(igt_kernel_tainted(&taints));
>  		}
> +
> +		free(result);
>  	}
>  
>  	ret = ktap_parser_stop();
> diff --git a/lib/igt_ktap.c b/lib/igt_ktap.c
> index 165f6b2cce..5e9967f980 100644
> --- a/lib/igt_ktap.c
> +++ b/lib/igt_ktap.c
> @@ -12,6 +12,7 @@
>  #include "igt_aux.h"
>  #include "igt_core.h"
>  #include "igt_ktap.h"
> +#include "igt_list.h"
>  
>  #define DELIMITER "-"
>  
> @@ -335,7 +336,7 @@ static int parse_tap_level(int fd, char *base_test_name, int test_count, bool *f
>  			   bool *found_tests, bool is_builtin)
>  {
>  	char record[BUF_LEN + 1];
> -	struct ktap_test_results_element *r, *temp;
> +	struct ktap_test_results_element *r;
>  	int internal_test_count;
>  	char test_name[BUF_LEN + 1];
>  	char base_test_name_for_next_level[BUF_LEN + 1];
> @@ -403,17 +404,9 @@ static int parse_tap_level(int fd, char *base_test_name, int test_count, bool *f
>  			r->test_name[BUF_LEN] = '\0';
>  
>  			r->passed = false;
> -			r->next = NULL;
>  
>  			pthread_mutex_lock(&results.mutex);
> -			if (results.head == NULL) {
> -				results.head = r;
> -			} else {
> -				temp = results.head;
> -				while (temp->next != NULL)
> -					temp = temp->next;
> -				temp->next = r;
> -			}
> +			igt_list_add_tail(&r->link, &results.list);
>  			pthread_mutex_unlock(&results.mutex);
>  
>  			test_name[0] = '\0';
> @@ -431,17 +424,9 @@ static int parse_tap_level(int fd, char *base_test_name, int test_count, bool *f
>  			r->test_name[BUF_LEN] = '\0';
>  
>  			r->passed = true;
> -			r->next = NULL;
>  
>  			pthread_mutex_lock(&results.mutex);
> -			if (results.head == NULL) {
> -				results.head = r;
> -			} else {
> -				temp = results.head;
> -				while (temp->next != NULL)
> -					temp = temp->next;
> -				temp->next = r;
> -			}
> +			igt_list_add_tail(&r->link, &results.list);
>  			pthread_mutex_unlock(&results.mutex);
>  
>  			test_name[0] = '\0';
> @@ -523,7 +508,7 @@ static pthread_t ktap_parser_thread;
>  
>  struct ktap_test_results *ktap_parser_start(int fd, bool is_builtin)
>  {
> -	results.head = NULL;
> +	IGT_INIT_LIST_HEAD(&results.list);
>  	pthread_mutex_init(&results.mutex, NULL);
>  	results.still_running = true;
>  
> diff --git a/lib/igt_ktap.h b/lib/igt_ktap.h
> index 991800e912..b4d7a6dbc7 100644
> --- a/lib/igt_ktap.h
> +++ b/lib/igt_ktap.h
> @@ -28,16 +28,18 @@
>  
>  #include <pthread.h>
>  
> +#include "igt_list.h"
> +
>  void *igt_ktap_parser(void *unused);
>  
>  typedef struct ktap_test_results_element {
>  	char test_name[BUF_LEN + 1];
>  	bool passed;
> -	struct ktap_test_results_element *next;
> +	struct igt_list_head link;
>  } ktap_test_results_element;
>  
>  struct ktap_test_results {
> -	ktap_test_results_element *head;
> +	struct igt_list_head list;
>  	pthread_mutex_t mutex;
>  	bool still_running;
>  };
