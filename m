Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3D8210E336
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Jun 2022 16:00:16 +0000 (UTC)
Date: Wed, 29 Jun 2022 18:00:11 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Ryszard Knop <ryszard.knop@intel.com>
Message-ID: <20220629180011.3553f31f@maurocar-mobl2>
In-Reply-To: <20220628094435.854519-4-ryszard.knop@intel.com>
References: <20220628094435.854519-1-ryszard.knop@intel.com>
 <20220628094435.854519-4-ryszard.knop@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t 3/7] igt_list: Add the
 igt_list_empty_or_null helper
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, 28 Jun 2022 11:44:31 +0200
Ryszard Knop <ryszard.knop@intel.com> wrote:

> Checks if the list is empty or uninitialized.

Looking at patch 4/7, I understand why you want this function:

	static bool add_env_var(struct igt_list_head *env_vars, char *env_kv) {
		char *current_env_value, *kv_split;
		struct environment_variable *var = NULL;
...
		if (igt_list_empty_or_null(env_vars))
			IGT_INIT_LIST_HEAD(env_vars);

Yet, I don't like the idea of conditionally initializing env_vars.

IMO, the best would be to always call IGT_INIT_LIST_HEAD(env_vars),
dropping the conditional check at add_env_var().

Regards,
Mauro

> 
> Signed-off-by: Ryszard Knop <ryszard.knop@intel.com>
> ---
>  lib/igt_list.c | 5 +++++
>  lib/igt_list.h | 1 +
>  2 files changed, 6 insertions(+)
> 
> diff --git a/lib/igt_list.c b/lib/igt_list.c
> index 37ae139c..dc94fad8 100644
> --- a/lib/igt_list.c
> +++ b/lib/igt_list.c
> @@ -81,3 +81,8 @@ bool igt_list_empty(const struct igt_list_head *head)
>  {
>  	return head->next == head;
>  }
> +
> +bool igt_list_empty_or_null(const struct igt_list_head *head)
> +{
> +	return head->next == NULL || head->prev == NULL || igt_list_empty(head);
> +}
> diff --git a/lib/igt_list.h b/lib/igt_list.h
> index be63fd80..4efb7a22 100644
> --- a/lib/igt_list.h
> +++ b/lib/igt_list.h
> @@ -80,6 +80,7 @@ void igt_list_move(struct igt_list_head *elem, struct igt_list_head *list);
>  void igt_list_move_tail(struct igt_list_head *elem, struct igt_list_head *list);
>  int igt_list_length(const struct igt_list_head *head);
>  bool igt_list_empty(const struct igt_list_head *head);
> +bool igt_list_empty_or_null(const struct igt_list_head *head);
>  
>  #define igt_container_of(ptr, sample, member)				\
>  	(__typeof__(sample))((char *)(ptr) -				\
