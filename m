Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 958FFCF8571
	for <igt-dev@archiver.kernel.org>; Thu,  3 Oct 2024 09:17:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21F1310E7DC;
	Thu,  3 Oct 2024 09:17:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K9NyAI7F";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C93C10E7DB
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Oct 2024 09:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727947064; x=1759483064;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=skOu5hFZ63qSpZBTGx054Ka8pEdPyiJAWw/WHlzHkf4=;
 b=K9NyAI7FZgtxOYt9Y3S8ePaLkSAhIIDDMp1wSnPz6xPTPJiaUGTvogg1
 x40Z9iqMI2s2bqjp4ODPmKucrhucIJYBKjUIjkIqPmHyfcncshlsHE+iQ
 1Nf3qIeVhCEXMEimIzV2/uyymdxonxg+gAJGCygvLbu3mLgcOvjdXC6XN
 xDfZgu5apWYH2mOmK0kEkdIUG7egF8uDmeLBZghuHEnEI80elvkZ1WHDY
 OF9pmBGf3wfQvfehbMkf6edljex7VcM4ojur5dfoqnk/vs0zioHVuCnu+
 koCqltDS0w0ikB0JpFiRTvTGjp3iaRiJqIbIHv+CvKaCaqgRTkBHwJe8Y A==;
X-CSE-ConnectionGUID: Vc3NLYuUSDWTRLQS/n5/ag==
X-CSE-MsgGUID: Px3CoyNVQtSdZ0oktvpwVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="26605256"
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; d="scan'208";a="26605256"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2024 02:17:43 -0700
X-CSE-ConnectionGUID: UdnmrG9GRx2cxSyFgtCXpg==
X-CSE-MsgGUID: e8EGXzoSQ22mHtz4A/2C9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; d="scan'208";a="74718897"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2024 02:17:42 -0700
Date: Thu, 3 Oct 2024 11:17:28 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Subject: Re: [PATCH i-g-t v4] tests/core_setmaster: Handle the test even if
 cards are non-continuous
Message-ID: <20241003091728.7n26xrmbewoeyini@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Bommu Krishnaiah <krishnaiah.bommu@intel.com>
References: <20241002152538.26971-1-krishnaiah.bommu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241002152538.26971-1-krishnaiah.bommu@intel.com>
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

Hi Bommu,
On 2024-10-02 at 20:55:38 +0530, Bommu Krishnaiah wrote:
> Although most of user space assumes drm cards to be populated continuously,
> this assumption may not be always true. After hot unpluging and repluging
> of card, the card may be non-continuous. To address such scenarios where
> the cards can be non-continuous Modify the tweak_perm function to loop all

Please update your description what did you changed, s/Modify the .../...
as now you changed how it works e.g. you do not modify perm for all cards
but only for the one we could open.

> possible card numbers(card0-card255) and break after first card found.
> 
> Problem Description:
> The test fails after running the `core_hotunplug@hot*` subtest, where
> Card0 is populated as card1, This leads to a failure in the subsequent
> `master-drop-set-user` test.
> 
> Command sequence for reproducing the issue:
> - Check available cards: `ls /dev/dri/`
>         - Output: by-path  card0  renderD128
> - Run the test: `# ./core_hotunplug --r hotrebind-lateclose`
> - Check again: ‘ls /dev/dri/’
>         - Output after core_hotunplug : by-path  card1  renderD129
> - Run the test: `# ./core_setmaster --r master-drop-set-user`
>         - Output: gta@core_setmaster@master-drop-set-user failure
> 
> This failures on both XE and i915 for above sequence.
> 
> v2: Break the loop after first card found and check return value of chmod.
> v3: Undated comments in code.
> v4: Refactor the code in master-drop-set-user
> 
> Signed-off-by: Bommu Krishnaiah krishnaiah.bommu@intel.com
> Cc: Emil Velikov emil.l.velikov@gmail.com
> Cc: Himal Prasad Ghimiray himal.prasad.ghimiray@intel.com
> Cc: Kamil Konieczny kamil.konieczny@linux.intel.com
> ---
>  tests/core_setmaster.c | 78 +++++++++++++++++++++++-------------------
>  1 file changed, 43 insertions(+), 35 deletions(-)
> 
> diff --git a/tests/core_setmaster.c b/tests/core_setmaster.c
> index 9c2083f66..137039782 100644
> --- a/tests/core_setmaster.c
> +++ b/tests/core_setmaster.c
> @@ -107,40 +107,28 @@ static void check_drop_set(void)
>  	drm_close_driver(master);
>  }
>  
> -static unsigned tweak_perm(uint8_t *saved_perm, unsigned max_perm, bool save)
> +static void tweak_perm(uint8_t *saved_perm, char *path, bool save)
>  {
> -	char path[256];
>  	struct stat st;
> -	unsigned i;
> -
> -	for (i = 0; i < max_perm; i++) {
> -		snprintf(path, sizeof(path), "/dev/dri/card%u", i);
> -
> -		/* Existing userspace assumes there's no gaps, do the same. */
> -		if (stat(path, &st) != 0)
> -			break;
> -
> -		if (save) {
> -			/* Save and toggle */
> -			saved_perm[i] = st.st_mode & (S_IROTH | S_IWOTH);
> -			st.st_mode |= S_IROTH | S_IWOTH;
> -		} else {
> -			/* Clear and restore */
> -			st.st_mode &= ~(S_IROTH | S_IWOTH);
> -			st.st_mode |= saved_perm[i];
> -		}
> -
> -		/* There's only one way for chmod to fail - race vs rmmod.
> -		 * In that case, do _not_ error/skip, since:
> -		 * - we need to restore the [correct] permissions
> -		 * - __drm_open_driver() can open another device, aka the
> -		 * failure may be irrelevant.
> -		 */
> -		chmod(path, st.st_mode);
> +	int ret;
> +

Before anything check for empty path, e.g. if path[0] == 0
you should just return.

> +	ret = stat(path, &st);
> +	igt_assert_f(!ret, "stat failed with %d path=%s\n", errno, path);
> +
> +	if (save) {
> +		/* Save and toggle */
> +		*saved_perm = st.st_mode & (S_IROTH | S_IWOTH);
> +		st.st_mode |= S_IROTH | S_IWOTH;
> +	} else {
> +		/* Clear and restore */
> +		st.st_mode &= ~(S_IROTH | S_IWOTH);
> +		st.st_mode |= *saved_perm;
>  	}
> -	return i;
> -}
>  
> +	/* There's only one way for chmod to fail - race vs rmmod. */
> +	ret = chmod(path, st.st_mode);
> +	igt_assert_f(!ret, "chmod failed with %d path=%s\n", errno, path);
> +}
>  
>  igt_main
>  {
> @@ -160,8 +148,8 @@ igt_main
>  
>  
>  	igt_subtest_group {
> -		uint8_t saved_perm[255];
> -		unsigned num;
> +		uint8_t saved_perm;
> +		char buf[255];
>  
>  		/* Upon dropping root we end up as random user, which
>  		 * a) is not in the video group, and
> @@ -176,8 +164,28 @@ igt_main
>  		 * restored on skip or failure.
>  		 */
>  		igt_fixture {
> -			num = tweak_perm(saved_perm, ARRAY_SIZE(saved_perm),
> -					 true);
> +			char path[255];
> +			int len;
> +			int fd;
> +
> +			fd = __drm_open_driver(DRIVER_ANY);
> +			igt_assert_fd(fd);
> +
> +			snprintf(path, sizeof(path), "/proc/self/fd/%d", fd);
> +
> +			memset(buf, 0, sizeof(buf));

Move that memset before __drm_open_driver() above.

> +			len = readlink(path, buf, sizeof(buf) - 1);
> +			if (len <= 0)
> +				igt_assert_f(0, "readlink failed with %d path=%s\n", errno, path);

imho just

			igt_assert_f(len <= 0, "readlink failed with %d path=%s\n", errno, path);

> +
> +			buf[len] = '\0';
> +			if (!(strstr(buf, "/dev/dri/card") == buf ||
> +					strstr(buf, "/dev/dri/renderD") == buf))
> +				igt_assert_f(0, "Not a card nor render, errno %d path=%s\n", errno, buf);

Hmm, I overlooked that, here errno will be zero so no need to print it
only path is needed.

Rest looks good,

Regards,
Kamil

> +
> +			igt_assert_eq(__drm_close_driver(fd), 0);
> +
> +			tweak_perm(&saved_perm, buf, true);
>  		}
>  
>  		igt_describe("Ensure first normal user can Set/DropMaster");
> @@ -191,7 +199,7 @@ igt_main
>  
>  		/* Restore the original permissions */
>  		igt_fixture {
> -			tweak_perm(saved_perm, num, false);
> +			tweak_perm(&saved_perm, buf, false);
>  		}
>  	}
>  
> -- 
> 2.34.1
> 
