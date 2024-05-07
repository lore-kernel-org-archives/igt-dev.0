Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66383C25B5F
	for <igt-dev@archiver.kernel.org>; Tue,  7 May 2024 17:13:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DE1010F66F;
	Tue,  7 May 2024 17:13:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YbCSM0lB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5587310F66F
 for <igt-dev@lists.freedesktop.org>; Tue,  7 May 2024 17:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715102026; x=1746638026;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=+HU7ZASj6GWVM7eEGW0mSGk4R/635yQgL+T2bg5gMro=;
 b=YbCSM0lBefF9+bnLpkJZ8/OR/qBTUpbt5E2t/sXblYONEbTeWZXPC6zA
 9SLsxPVZS1h7f0JjBr0rLMedFa+pGYa36WiuIpj0xbMC6o46hP0Abk65S
 /xL1wafxDColV+8MHFz+fLZD+H9qu+GwTdZcLVqS7mqJCCst1UE4FcWyb
 ffUFEq1xueqZ/s1zW9e33fZkm5AdjQJi4V2hPe19YIHPjQCaKsmBRkhVg
 ineCghaocfF23oopCZ5/8G8fkqKRVnvswz6oZtJG6BdrNzwYoTDUQOv8+
 2EHOUSvHy4vT1mfpZbuwtajhsdXvDZdujLEW7p8PHSk1TYsaBHAAchTQA Q==;
X-CSE-ConnectionGUID: cOxxqKPXTIy4rHEc9B/zfQ==
X-CSE-MsgGUID: lSBqHCekSiOO55oLIUk4HQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="14704535"
X-IronPort-AV: E=Sophos;i="6.08,142,1712646000"; d="scan'208";a="14704535"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2024 10:13:46 -0700
X-CSE-ConnectionGUID: OTseH5flSKaMjFpwRlLNRA==
X-CSE-MsgGUID: oK5Eb2GLRVq9NglmpbBsVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,142,1712646000"; d="scan'208";a="33411007"
Received: from nkwan-mobl.amr.corp.intel.com (HELO [10.125.82.136])
 ([10.125.82.136])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2024 10:13:46 -0700
Message-ID: <7e484d91-9c79-45db-9f15-9782eb4bbb51@linux.intel.com>
Date: Tue, 7 May 2024 10:13:45 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t] runner: Remove useless null check for delim in
 job_list_from_test_list
To: Gustavo Sousa <gustavo.sousa@intel.com>, igt-dev@lists.freedesktop.org
References: <20240430211934.349775-2-gustavo.sousa@intel.com>
Content-Language: en-US
From: Ngai-Mint Kwan <ngai-mint.kwan@linux.intel.com>
In-Reply-To: <20240430211934.349775-2-gustavo.sousa@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Hi Gustavo,

On 2024-04-30 14:19, Gustavo Sousa wrote:
> The function job_list_from_test_list() uses a while loop to read entries
> from the testlist.
>
> The condition ((delim = strchr(binary, '@')) != NULL) checks if the
> current entry specifies a subtest. When no subtest is specified, the
> else clause will cause a jump to the next iteration. That means that we
> are certain any statement executed after that if block has (delim !=
> NULL). As such, all null checks on that variable after that point are
> pointless.
>
> In fact, certain unnecessary null checks might even cause confusion to
> readers. One example is the block meant to display the "Unexpected test
> without subtests ..." message: it would never happen, since that
> condition is handled earlier in the iteration (i.e. the full set of
> subtests is expanded for that entry in the else clause previously
> mentioned). The following execution (done before this change)
> illustrates that:
>
>      $ cat <<EOF > /tmp/foo.testlist
>      igt@xe_pm@s2idle-basic
>      igt@xe_pm
>      igt@xe_pm@s2idle-exec-after
>      EOF
>
>      $ ./build/runner/igt_runner -d -m --test-list /tmp/foo.testlist build/tests /tmp/results
>      [36408.109043] Dry run, not executing. Invoke igt_resume if you want to execute.
>      Done.
>
>      $ cat /tmp/results/joblist.txt | sed 's/^\(.\{50\}\).\+/\1.../'
>      xe_pm s2idle-basic
>      xe_pm s2idle-basic,s2idle-basic-exec,s2idle-exec-a...
>      xe_pm s2idle-exec-after
>
> Let's remove those unnecessary checks.
>
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>

Reviewed-by: Ngai-Mint Kwan <ngai-mint.kwan@linux.intel.com>

Thanks,
Ngai-Mint Kwan

> ---
>   runner/job_list.c | 21 +++++----------------
>   1 file changed, 5 insertions(+), 16 deletions(-)
>
> diff --git a/runner/job_list.c b/runner/job_list.c
> index 27cbb10bce56..aeabb59f49d3 100644
> --- a/runner/job_list.c
> +++ b/runner/job_list.c
> @@ -276,16 +276,7 @@ static bool job_list_from_test_list(struct job_list *job_list,
>   			 * specified, also start a new entry.
>   			 */
>   			if (entry.binary && !strcmp(entry.binary, binary) &&
> -			    (delim == NULL || strchr(delim, '@') == NULL)) {
> -				if (!delim) {
> -					/* ... except we didn't get a subtest */
> -					fprintf(stderr,
> -						"Error: Unexpected test without subtests "
> -						"after same test had subtests\n");
> -					free(binary);
> -					fclose(f);
> -					return false;
> -				}
> +			    strchr(delim, '@') == NULL) {
>   				entry.subtest_count++;
>   				entry.subtests = realloc(entry.subtests,
>   							 entry.subtest_count *
> @@ -303,7 +294,7 @@ static bool job_list_from_test_list(struct job_list *job_list,
>   
>   			memset(&entry, 0, sizeof(entry));
>   
> -			if (delim != NULL && strchr(delim, '@') != NULL) {
> +			if (strchr(delim, '@') != NULL) {
>   				/* Dynamic subtest specified. Add to job list alone. */
>   				char **subtests;
>   
> @@ -314,11 +305,9 @@ static bool job_list_from_test_list(struct job_list *job_list,
>   				any = true;
>   			} else {
>   				entry.binary = strdup(binary);
> -				if (delim) {
> -					entry.subtests = malloc(sizeof(*entry.subtests));
> -					entry.subtests[0] = strdup(delim);
> -					entry.subtest_count = 1;
> -				}
> +				entry.subtests = malloc(sizeof(*entry.subtests));
> +				entry.subtests[0] = strdup(delim);
> +				entry.subtest_count = 1;
>   			}
>   
>   			free(binary);

