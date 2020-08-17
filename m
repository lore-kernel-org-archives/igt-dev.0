Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F8786E417
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Aug 2020 07:03:22 +0000 (UTC)
Date: Mon, 17 Aug 2020 09:16:31 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200817061631.GZ7444@platvala-desk.ger.corp.intel.com>
References: <20200815051637.2719528-1-kunal1.joshi@intel.com>
 <20200815051637.2719528-4-kunal1.joshi@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200815051637.2719528-4-kunal1.joshi@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v3 3/3] Added a subtest where chamelium
 acts as a tiled panel.
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Kunal Joshi <kunal1.joshi@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Sat, Aug 15, 2020 at 10:46:37AM +0530, Kunal Joshi wrote:
> Split kms_dp_tiled_display into to two subtest.First to execute the
> basic test with physical tiled panel and second with chamelium.
> 
> v2: Revised to just have basic test if chamelium dependencies are not present.
>     Reset ports after the test executes.Changed subtest name from with-chamelium
>     to basic-test-pattern-with-chamelium
> 
> v3: Changes required to adapt to changes done in first patch.
> 
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
> Reviewed-by: Navare Manasi D <manasi.d.navare@intel.com>
> ---
>  tests/kms_dp_tiled_display.c | 119 ++++++++++++++++++++++++++++-------
>  1 file changed, 95 insertions(+), 24 deletions(-)
> 
> diff --git a/tests/kms_dp_tiled_display.c b/tests/kms_dp_tiled_display.c
> index b1160fee..582727a2 100644
> --- a/tests/kms_dp_tiled_display.c
> +++ b/tests/kms_dp_tiled_display.c
> @@ -40,6 +40,7 @@
>  #include "poll.h"
>  #include "drm_mode.h"
>  #include "drm_fourcc.h"
> +#include "igt_edid.h"
>  
>  IGT_TEST_DESCRIPTION("Test for Transcoder Port Sync for Display Port Tiled Displays");
>  
> @@ -59,8 +60,22 @@ typedef struct {
>  	data_connector_t *conns;
>  	enum igt_commit_style commit;
>  	struct timeval first_ts;
> +
> +	#ifdef HAVE_CHAMELIUM
> +	struct chamelium *chamelium;
> +	struct chamelium_port **ports;
> +	int port_count;
> +	struct chamelium_edid *edids[TEST_EDID_COUNT];
> +	#endif
> +
>  } data_t;
>  
> +void basic_test(data_t *data, drmEventContext *drm_event, struct pollfd *pfd);
> +
> +#ifdef HAVE_CHAMELIUM
> +static void test_with_chamelium(data_t *data);
> +#endif
> +
>  static int drm_property_is_tile(drmModePropertyPtr prop)
>  {
>  	return (strcmp(prop->name, "TILE") ? 0 : 1) &&
> @@ -206,7 +221,6 @@ static void test_cleanup(data_t *data)
>  	igt_display_commit2(data->display, data->commit);
>  	memset(conns, 0, sizeof(data_connector_t) * data->num_h_tiles);
>  }
> -
>  static void setup_mode(data_t *data)
>  {
>  	int count = 0, prev = 0, i = 0;
> @@ -380,21 +394,83 @@ static bool got_all_page_flips(data_t *data)
>  	return true;
>  }
>  
> +#ifdef HAVE_CHAMELIUM
> +static void test_with_chamelium(data_t *data)
> +{
> +	int i, count = 0;
> +	uint8_t htile = 2, vtile = 1;
> +	struct edid **edid;
> +
> +	data->chamelium = chamelium_init(data->drm_fd);
> +	igt_assert(data->chamelium);

igt_require the chamelium init, not assert. The driver is not broken
if we don't have chamelium configured.


-- 
Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
