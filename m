Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D29BAEEA84E
	for <igt-dev@archiver.kernel.org>; Fri, 13 Feb 2026 16:40:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 857B010E837;
	Fri, 13 Feb 2026 16:40:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="k1CPO6uW";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68CC010E837
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Feb 2026 16:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:From:References:To:Subject:MIME-Version:Date:
 Message-ID:Content-Type:Sender:Reply-To:Cc:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1maEUmDQXR2+QYVofq/tM7XKosPP9RQ9HyOhy5yO31U=; b=k1CPO6uWhtS+JPWdfvjqheizY+
 CxvM4NtRuDX5OsJJN00a+RcJQBFR0P/QI5qiQsiMHxn1rMTYOwB3Ps8S6QUll2UZgLmJ3NFYwjRYo
 XrP8+xg0Cr6znhSjkf+CrfSWCxdOuKDdYZTIxn0CVKgG6bfdTEqOp7Jhl4Zaewh47v6PDWjasXt/4
 HmpDBwN3eFYmsYjxMcSpWxyC6Jg4iPuhLbpcpBOwnK+umKqkzUkv/krax/mW8+E1qhOYndhZ09V2q
 CK1BaiB1SlQs/+6lX7BazwjxHXQgwGDS9x7z4i7XGKEOSCC4mzIeBv6kk07O3QjA1RjxSFB3IUBPa
 trkIPV6A==;
Received: from c-73-157-168-91.hsd1.or.comcast.net ([73.157.168.91]
 helo=[192.168.1.132]) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1vqwCu-000QBP-LW
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Feb 2026 17:39:53 +0100
Content-Type: multipart/alternative;
 boundary="------------r0w1xrZjC0dmTNnAcYuxsEH7"
Message-ID: <a127eb09-ce8c-4569-a17a-8451bda4237a@Igalia.com>
Date: Fri, 13 Feb 2026 08:39:48 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_tool/intel?=
 =?UTF-8?Q?=5Fhdcp=3A_Fix_flickering_and_show_actual_HDCP_status?=
To: igt-dev@lists.freedesktop.org
References: <20260211214631.265577-1-John.Harrison@Igalia.com>
 <177095893569.250939.16894445838167334699@a3b018990fe9>
Content-Language: en-GB
From: John Harrison <John.Harrison@Igalia.com>
In-Reply-To: <177095893569.250939.16894445838167334699@a3b018990fe9>
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

This is a multi-part message in MIME format.
--------------r0w1xrZjC0dmTNnAcYuxsEH7
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/12/26 21:02, Patchwork wrote:
> Project List - Patchwork *Patch Details*
> *Series:* 	tool/intel_hdcp: Fix flickering and show actual HDCP status
> *URL:* 	https://patchwork.freedesktop.org/series/161513/
> *State:* 	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/index.html
>
>
>   CI Bug Log - changes from XEIGT_8751_FULL -> XEIGTPW_14543_FULL
>
>
>     Summary
>
> *FAILURE*
>
> Serious unknown changes coming with XEIGTPW_14543_FULL absolutely need 
> to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in XEIGTPW_14543_FULL, please notify your bug team 
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives 
> in CI.
>
>
>     Participating hosts (2 -> 2)
>
> No changes in participating hosts
>
>
>     Possible new issues
>
> Here are the unknown changes that may have been introduced in 
> XEIGTPW_14543_FULL:
>
>
>       IGT changes
>
>
>         Possible regressions
>
>  *
>
>     igt@kms_async_flips@alternate-sync-async-flip@pipe-c-edp-1:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8751/shard-lnl-3/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-edp-1.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-lnl-5/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-edp-1.html>
>  *
>
>     igt@xe_pm_residency@aspm_link_residency:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8751/shard-bmg-7/igt@xe_pm_residency@aspm_link_residency.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-5/igt@xe_pm_residency@aspm_link_residency.html>
>
My change is entirely self contained within the intel_hdcp tool, code 
which is not used by any other test. So these regressions are unrelated 
to my change.

John.

>  *
>
>
>     New tests
>
> New tests have been introduced between XEIGT_8751_FULL and 
> XEIGTPW_14543_FULL:
>
>
>       New IGT tests (1)
>
>   * igt@kms_flip@flip-vs-rmfb-interruptible@d-hdmi-a3:
>       o Statuses : 1 pass(s)
>       o Exec time: [3.94] s
>
>
>     Known issues
>
> Here are the changes found in XEIGTPW_14543_FULL that come from known 
> issues:
>
>
>       IGT changes
>
>
>         Issues hit
>
>  *
>
>     igt@intel_hwmon@hwmon-write:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8751/shard-bmg-1/igt@intel_hwmon@hwmon-write.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-5/igt@intel_hwmon@hwmon-write.html>
>         (Intel XE#4665
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4665>)
>  *
>
>     igt@kms_async_flips@alternate-sync-async-flip:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8751/shard-lnl-3/igt@kms_async_flips@alternate-sync-async-flip.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-lnl-5/igt@kms_async_flips@alternate-sync-async-flip.html>
>         (Intel XE#3718
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718>)
>  *
>
>     igt@kms_async_flips@async-flip-with-page-flip-events-linear:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8751/shard-lnl-1/igt@kms_async_flips@async-flip-with-page-flip-events-linear.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-lnl-6/igt@kms_async_flips@async-flip-with-page-flip-events-linear.html>
>         (Intel XE#5993
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5993>) +3
>         other tests fail
>  *
>
>     igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html>
>         (Intel XE#2370
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370>)
>  *
>
>     igt@kms_big_fb@linear-32bpp-rotate-270:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-5/igt@kms_big_fb@linear-32bpp-rotate-270.html>
>         (Intel XE#2327
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327>) +3
>         other tests skip
>  *
>
>     igt@kms_big_fb@linear-8bpp-rotate-270:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-lnl-1/igt@kms_big_fb@linear-8bpp-rotate-270.html>
>         (Intel XE#1407
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407>)
>  *
>
>     igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-8/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html>
>         (Intel XE#7059
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059>)
>  *
>
>     igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +9
>         other tests skip
>  *
>
>     igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-lnl-2/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +2
>         other tests skip
>  *
>
>     igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-lnl-8/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html>
>         (Intel XE#2191
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191>)
>  *
>
>     igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-7/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html>
>         (Intel XE#2314
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314> /
>         Intel XE#2894
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894>) +1
>         other test skip
>  *
>
>     igt@kms_bw@linear-tiling-2-displays-2160x1440p:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-6/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html>
>         (Intel XE#367
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>) +1
>         other test skip
>  *
>
>     igt@kms_bw@linear-tiling-2-displays-2560x1440p:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-lnl-3/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html>
>         (Intel XE#367
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>)
>  *
>
>     igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs@pipe-a-edp-1:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-lnl-6/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs@pipe-a-edp-1.html>
>         (Intel XE#2669
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669>) +3
>         other tests skip
>  *
>
>     igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-lnl-4/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html>
>         (Intel XE#3432
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432>)
>  *
>
>     igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html>
>         (Intel XE#3432
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432>) +1
>         other test skip
>  *
>
>     igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-lnl-7/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs.html>
>         (Intel XE#2887
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887>) +3
>         other tests skip
>  *
>
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-1/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html>
>         (Intel XE#2887
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887>)
>         +13 other tests skip
>  *
>
>     igt@kms_cdclk@mode-transition:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-7/igt@kms_cdclk@mode-transition.html>
>         (Intel XE#2724
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724>)
>  *
>
>     igt@kms_chamelium_color@degamma:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-10/igt@kms_chamelium_color@degamma.html>
>         (Intel XE#2325
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325>)
>  *
>
>     igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-lnl-3/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html>
>         (Intel XE#373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +1
>         other test skip
>  *
>
>     igt@kms_chamelium_hpd@dp-hpd-for-each-pipe:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-3/igt@kms_chamelium_hpd@dp-hpd-for-each-pipe.html>
>         (Intel XE#2252
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252>) +6
>         other tests skip
>  *
>
>     igt@kms_chamelium_sharpness_filter@filter-basic:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-6/igt@kms_chamelium_sharpness_filter@filter-basic.html>
>         (Intel XE#6507
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6507>)
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-lnl-4/igt@kms_chamelium_sharpness_filter@filter-basic.html>
>         (Intel XE#6507
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6507>)
>  *
>
>     igt@kms_content_protection@dp-mst-lic-type-1:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-10/igt@kms_content_protection@dp-mst-lic-type-1.html>
>         (Intel XE#2390
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390> /
>         Intel XE#6974
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974>)
>  *
>
>     igt@kms_content_protection@dp-mst-type-0-hdcp14:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-8/igt@kms_content_protection@dp-mst-type-0-hdcp14.html>
>         (Intel XE#6974
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974>)
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-lnl-2/igt@kms_content_protection@dp-mst-type-0-hdcp14.html>
>         (Intel XE#6974
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974>)
>  *
>
>     igt@kms_content_protection@dp-mst-type-1:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-lnl-4/igt@kms_content_protection@dp-mst-type-1.html>
>         (Intel XE#307
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/307> /
>         Intel XE#6974
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974>)
>  *
>
>     igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-1:
>
>       o shard-bmg: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-5/igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-1.html>
>         (Intel XE#3304
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304>) +2
>         other tests fail
>  *
>
>     igt@kms_content_protection@uevent@pipe-a-dp-1:
>
>       o shard-bmg: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-5/igt@kms_content_protection@uevent@pipe-a-dp-1.html>
>         (Intel XE#6707
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707>)
>  *
>
>     igt@kms_cursor_crc@cursor-offscreen-32x10:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-10/igt@kms_cursor_crc@cursor-offscreen-32x10.html>
>         (Intel XE#2320
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320>) +1
>         other test skip
>  *
>
>     igt@kms_cursor_crc@cursor-onscreen-512x170:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-lnl-4/igt@kms_cursor_crc@cursor-onscreen-512x170.html>
>         (Intel XE#2321
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321>)
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-6/igt@kms_cursor_crc@cursor-onscreen-512x170.html>
>         (Intel XE#2321
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321>)
>  *
>
>     igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-5/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html>
>         (Intel XE#1508
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508>)
>  *
>
>     igt@kms_feature_discovery@psr2:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-6/igt@kms_feature_discovery@psr2.html>
>         (Intel XE#2374
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374>)
>  *
>
>     igt@kms_flip@2x-nonexisting-fb:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-lnl-5/igt@kms_flip@2x-nonexisting-fb.html>
>         (Intel XE#1421
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421>) +1
>         other test skip
>  *
>
>     igt@kms_flip@flip-vs-suspend-interruptible:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8751/shard-bmg-3/igt@kms_flip@flip-vs-suspend-interruptible.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-1/igt@kms_flip@flip-vs-suspend-interruptible.html>
>         (Intel XE#2049
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049> /
>         Intel XE#2597
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597>) +1
>         other test incomplete
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html>
>         (Intel XE#7178
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178>) +2
>         other tests skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html>
>         (Intel XE#1397
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397> /
>         Intel XE#1745
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745>) +1
>         other test skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-default-mode:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-default-mode.html>
>         (Intel XE#1397
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397>) +1
>         other test skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html>
>         (Intel XE#7178
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178>)
>  *
>
>     igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-6/igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x.html>
>         (Intel XE#7179
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179>)
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-lnl-6/igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x.html>
>         (Intel XE#7179
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179>)
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html>
>         (Intel XE#2311
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311>)
>         +23 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt.html>
>         (Intel XE#4141
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141>)
>         +10 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-mmap-wc:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-mmap-wc.html>
>         (Intel XE#7061
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061>) +4
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-blt:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-blt.html>
>         (Intel XE#7061
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061>) +1
>         other test skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-render:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-render.html>
>         (Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +4
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html>
>         (Intel XE#2352
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352>) +1
>         other test skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html>
>         (Intel XE#656
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/656>) +10
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc.html>
>         (Intel XE#2313
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313>)
>         +28 other tests skip
>  *
>
>     igt@kms_hdr@invalid-hdr:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-4/igt@kms_hdr@invalid-hdr.html>
>         (Intel XE#1503
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503>)
>  *
>
>     igt@kms_joiner@basic-force-ultra-joiner:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-6/igt@kms_joiner@basic-force-ultra-joiner.html>
>         (Intel XE#6911
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911>) +1
>         other test skip
>  *
>
>     igt@kms_joiner@basic-ultra-joiner:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-lnl-3/igt@kms_joiner@basic-ultra-joiner.html>
>         (Intel XE#6900
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6900>) +1
>         other test skip
>  *
>
>     igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-6/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html>
>         (Intel XE#4090
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4090>)
>  *
>
>     igt@kms_panel_fitting@atomic-fastset:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-4/igt@kms_panel_fitting@atomic-fastset.html>
>         (Intel XE#2486
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486>)
>  *
>
>     igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-6/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping.html>
>         (Intel XE#7111
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7111> /
>         Intel XE#7130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7130> /
>         Intel XE#7131
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7131>) +1
>         other test skip
>  *
>
>     igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping@pipe-b-plane-5:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-6/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping@pipe-b-plane-5.html>
>         (Intel XE#7111
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7111> /
>         Intel XE#7131
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7131>) +1
>         other test skip
>  *
>
>     igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-a-plane-0:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-7/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-a-plane-0.html>
>         (Intel XE#7130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7130>)
>         +34 other tests skip
>  *
>
>     igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-b-plane-5:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-7/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-b-plane-5.html>
>         (Intel XE#7111
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7111> /
>         Intel XE#7130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7130>) +9
>         other tests skip
>  *
>
>     igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier-source-clamping@pipe-a-plane-5:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-8/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier-source-clamping@pipe-a-plane-5.html>
>         (Intel XE#7131
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7131>) +1
>         other test skip
>  *
>
>     igt@kms_plane@pixel-format-yf-tiled-modifier@pipe-b-plane-5:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-lnl-7/igt@kms_plane@pixel-format-yf-tiled-modifier@pipe-b-plane-5.html>
>         (Intel XE#7130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7130>) +6
>         other tests skip
>  *
>
>     igt@kms_plane_lowres@tiling-yf:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-5/igt@kms_plane_lowres@tiling-yf.html>
>         (Intel XE#2393
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393>)
>  *
>
>     igt@kms_plane_multiple@tiling-y:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-4/igt@kms_plane_multiple@tiling-y.html>
>         (Intel XE#5020
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020>)
>  *
>
>     igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-lnl-6/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers.html>
>         (Intel XE#6886
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886>) +3
>         other tests skip
>  *
>
>     igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-6/igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a.html>
>         (Intel XE#6886
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886>) +4
>         other tests skip
>  *
>
>     igt@kms_pm_dc@dc6-psr:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-4/igt@kms_pm_dc@dc6-psr.html>
>         (Intel XE#2392
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392>)
>  *
>
>     igt@kms_pm_dc@deep-pkgc:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-10/igt@kms_pm_dc@deep-pkgc.html>
>         (Intel XE#2505
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505>)
>  *
>
>     igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8751/shard-bmg-9/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-6/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html>
>         (Intel XE#7197
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7197>)
>  *
>
>     igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-lnl-1/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html>
>         (Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406> /
>         Intel XE#2893
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893> /
>         Intel XE#4608
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608>) +1
>         other test skip
>  *
>
>     igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area@pipe-a-edp-1:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-lnl-1/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area@pipe-a-edp-1.html>
>         (Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406> /
>         Intel XE#4608
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608>) +3
>         other tests skip
>  *
>
>     igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-3/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html>
>         (Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406> /
>         Intel XE#1489
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) +8
>         other tests skip
>  *
>
>     igt@kms_psr2_su@page_flip-xrgb8888:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-4/igt@kms_psr2_su@page_flip-xrgb8888.html>
>         (Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406> /
>         Intel XE#2387
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387>)
>  *
>
>     igt@kms_psr@pr-cursor-plane-move:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-lnl-4/igt@kms_psr@pr-cursor-plane-move.html>
>         (Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406>) +2
>         other tests skip
>  *
>
>     igt@kms_psr@psr2-primary-page-flip:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-3/igt@kms_psr@psr2-primary-page-flip.html>
>         (Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406> /
>         Intel XE#2234
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234> /
>         Intel XE#2850
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850>) +9
>         other tests skip
>  *
>
>     igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html>
>         (Intel XE#2330
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330>) +1
>         other test skip
>  *
>
>     igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-lnl-8/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html>
>         (Intel XE#3414
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414> /
>         Intel XE#3904
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904>) +1
>         other test skip
>  *
>
>     igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html>
>         (Intel XE#3414
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414> /
>         Intel XE#3904
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904>) +1
>         other test skip
>  *
>
>     igt@kms_scaling_modes@scaling-mode-center:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-7/igt@kms_scaling_modes@scaling-mode-center.html>
>         (Intel XE#2413
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413>)
>  *
>
>     igt@kms_setmode@invalid-clone-exclusive-crtc:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-10/igt@kms_setmode@invalid-clone-exclusive-crtc.html>
>         (Intel XE#1435
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435>)
>  *
>
>     igt@kms_sharpness_filter@filter-toggle:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-3/igt@kms_sharpness_filter@filter-toggle.html>
>         (Intel XE#6503
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503>)
>  *
>
>     igt@kms_tiled_display@basic-test-pattern:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern.html>
>         (Intel XE#2426
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426>)
>  *
>
>     igt@kms_tv_load_detect@load-detect:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-lnl-1/igt@kms_tv_load_detect@load-detect.html>
>         (Intel XE#330
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/330>)
>  *
>
>     igt@kms_vrr@flipline:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-4/igt@kms_vrr@flipline.html>
>         (Intel XE#1499
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499>)
>  *
>
>     igt@kms_vrr@lobf:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-9/igt@kms_vrr@lobf.html>
>         (Intel XE#2168
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168>)
>  *
>
>     igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8751/shard-lnl-5/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-lnl-4/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html>
>         (Intel XE#2142
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142>) +1
>         other test fail
>  *
>
>     igt@xe_eudebug@basic-vm-access-userptr-faultable:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-lnl-4/igt@xe_eudebug@basic-vm-access-userptr-faultable.html>
>         (Intel XE#4837
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837>) +3
>         other tests skip
>  *
>
>     igt@xe_eudebug@connect-user:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-3/igt@xe_eudebug@connect-user.html>
>         (Intel XE#4837
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837>)
>         +11 other tests skip
>  *
>
>     igt@xe_eudebug_online@breakpoint-many-sessions-single-tile:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-3/igt@xe_eudebug_online@breakpoint-many-sessions-single-tile.html>
>         (Intel XE#4837
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837> /
>         Intel XE#6665
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665>) +2
>         other tests skip
>  *
>
>     igt@xe_evict@evict-beng-cm-threads-small:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-lnl-6/igt@xe_evict@evict-beng-cm-threads-small.html>
>         (Intel XE#688
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/688>) +3
>         other tests skip
>  *
>
>     igt@xe_evict@evict-small-multi-queue:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-1/igt@xe_evict@evict-small-multi-queue.html>
>         (Intel XE#7140
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7140>)
>  *
>
>     igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate.html>
>         (Intel XE#2322
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322>) +6
>         other tests skip
>  *
>
>     igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-lnl-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html>
>         (Intel XE#1392
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392>) +1
>         other test skip
>  *
>
>     igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-lnl-2/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate.html>
>         (Intel XE#7136
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136>) +2
>         other tests skip
>  *
>
>     igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-imm:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-6/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-imm.html>
>         (Intel XE#7136
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136>)
>         +12 other tests skip
>  *
>
>     igt@xe_exec_multi_queue@many-execs-priority:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-lnl-4/igt@xe_exec_multi_queue@many-execs-priority.html>
>         (Intel XE#6874
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874>) +9
>         other tests skip
>  *
>
>     igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-priority:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-9/igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-priority.html>
>         (Intel XE#6874
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874>)
>         +21 other tests skip
>  *
>
>     igt@xe_exec_threads@threads-many-queues:
>
>       o shard-bmg: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-9/igt@xe_exec_threads@threads-many-queues.html>
>         (Intel XE#7166
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7166>)
>  *
>
>     igt@xe_exec_threads@threads-multi-queue-mixed-basic:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-lnl-3/igt@xe_exec_threads@threads-multi-queue-mixed-basic.html>
>         (Intel XE#7138
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138>) +2
>         other tests skip
>  *
>
>     igt@xe_exec_threads@threads-multi-queue-mixed-userptr-invalidate:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-6/igt@xe_exec_threads@threads-multi-queue-mixed-userptr-invalidate.html>
>         (Intel XE#7138
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138>) +6
>         other tests skip
>  *
>
>     igt@xe_mmap@small-bar:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-10/igt@xe_mmap@small-bar.html>
>         (Intel XE#586
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/586>)
>  *
>
>     igt@xe_multigpu_svm@mgpu-latency-prefetch:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-7/igt@xe_multigpu_svm@mgpu-latency-prefetch.html>
>         (Intel XE#6964
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964>) +2
>         other tests skip
>  *
>
>     igt@xe_oa@oa-tlb-invalidate:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-8/igt@xe_oa@oa-tlb-invalidate.html>
>         (Intel XE#2248
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248>)
>  *
>
>     igt@xe_pat@pat-index-xehpc:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-1/igt@xe_pat@pat-index-xehpc.html>
>         (Intel XE#1420
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420>)
>  *
>
>     igt@xe_pm@d3cold-i2c:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-3/igt@xe_pm@d3cold-i2c.html>
>         (Intel XE#5694
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694>)
>  *
>
>     igt@xe_pm@s3-d3cold-basic-exec:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-lnl-3/igt@xe_pm@s3-d3cold-basic-exec.html>
>         (Intel XE#2284
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284> /
>         Intel XE#366
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/366>)
>  *
>
>     igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-8/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html>
>         (Intel XE#4733
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733>) +3
>         other tests skip
>  *
>
>     igt@xe_query@multigpu-query-invalid-query:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-3/igt@xe_query@multigpu-query-invalid-query.html>
>         (Intel XE#944
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>)
>  *
>
>     igt@xe_query@multigpu-query-invalid-size:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-lnl-6/igt@xe_query@multigpu-query-invalid-size.html>
>         (Intel XE#944
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>)
>  *
>
>     igt@xe_sriov_admin@bulk-sched-priority-vfs-disabled:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-lnl-2/igt@xe_sriov_admin@bulk-sched-priority-vfs-disabled.html>
>         (Intel XE#7174
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7174>) +1
>         other test skip
>  *
>
>     igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8751/shard-bmg-3/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-3/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs.html>
>         (Intel XE#5937
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5937>) +1
>         other test fail
>  *
>
>     igt@xe_sriov_flr@flr-twice:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-lnl-8/igt@xe_sriov_flr@flr-twice.html>
>         (Intel XE#4273
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273>)
>  *
>
>     igt@xe_sriov_flr@flr-vf1-clear:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8751/shard-bmg-10/igt@xe_sriov_flr@flr-vf1-clear.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-5/igt@xe_sriov_flr@flr-vf1-clear.html>
>         (Intel XE#6569
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569>)
>
>
>         Possible fixes
>
>  *
>
>     igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1:
>
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8751/shard-lnl-4/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html>
>         (Intel XE#6054
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6054>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-lnl-8/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html>
>         +3 other tests pass
>  *
>
>     igt@kms_vblank@ts-continuation-dpms-rpm:
>
>       o shard-lnl: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8751/shard-lnl-6/igt@kms_vblank@ts-continuation-dpms-rpm.html>
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-lnl-2/igt@kms_vblank@ts-continuation-dpms-rpm.html>
>         +2 other tests pass
>  *
>
>     igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-mlock-nomemset:
>
>       o shard-bmg: ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8751/shard-bmg-1/igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-mlock-nomemset.html>
>         (Intel XE#7169
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7169>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-8/igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-mlock-nomemset.html>
>  *
>
>     igt@xe_pm@s2idle-mocs:
>
>       o shard-lnl: ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8751/shard-lnl-6/igt@xe_pm@s2idle-mocs.html>
>         (Intel XE#7169
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7169>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-lnl-6/igt@xe_pm@s2idle-mocs.html>
>
>
>         Warnings
>
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:
>
>       o shard-bmg: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8751/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html>
>         (Intel XE#2594
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html>
>         (Intel XE#7178
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178>)
>  *
>
>     igt@kms_hdr@brightness-with-hdr:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8751/shard-bmg-9/igt@kms_hdr@brightness-with-hdr.html>
>         (Intel XE#3544
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-5/igt@kms_hdr@brightness-with-hdr.html>
>         (Intel XE#3374
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374> /
>         Intel XE#3544
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544>)
>  *
>
>     igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
>
>       o shard-lnl: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8751/shard-lnl-1/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html>
>         (Intel XE#1439
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439> /
>         Intel XE#836
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/836>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-lnl-4/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html>
>         (Intel XE#7197
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7197>)
>  *
>
>     igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8751/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html>
>         (Intel XE#2509
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html>
>         (Intel XE#2426
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426>)
>
>
>     Build changes
>
>   * IGT: IGT_8751 -> IGTPW_14543
>   * Linux: xe-4544-2938ce73d01357a5816ed7dbd041154b58635a37 ->
>     xe-4545-b4bfe7d753afaf6ea4950111a309a4e2ef5aef68
>
> IGTPW_14543: 14543
> IGT_8751: af788251f1ef729d17c802aec2c4547b52059e58 @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> xe-4544-2938ce73d01357a5816ed7dbd041154b58635a37: 
> 2938ce73d01357a5816ed7dbd041154b58635a37
> xe-4545-b4bfe7d753afaf6ea4950111a309a4e2ef5aef68: 
> b4bfe7d753afaf6ea4950111a309a4e2ef5aef68
>

--------------r0w1xrZjC0dmTNnAcYuxsEH7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2/12/26 21:02, Patchwork wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:177095893569.250939.16894445838167334699@a3b018990fe9">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>Project List - Patchwork</title>
      <style id="css-table-select" type="text/css">td { padding: 2pt; }</style>
      <b>Patch Details</b>
      <table>
        <tbody>
          <tr>
            <td><b>Series:</b></td>
            <td>tool/intel_hdcp: Fix flickering and show actual HDCP
              status</td>
          </tr>
          <tr>
            <td><b>URL:</b></td>
            <td><a
                href="https://patchwork.freedesktop.org/series/161513/"
                moz-do-not-send="true" class="moz-txt-link-freetext">https://patchwork.freedesktop.org/series/161513/</a></td>
          </tr>
          <tr>
            <td><b>State:</b></td>
            <td>failure</td>
          </tr>
          <tr>
            <td><b>Details:</b></td>
            <td><a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/index.html"
                moz-do-not-send="true" class="moz-txt-link-freetext">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/index.html</a></td>
          </tr>
        </tbody>
      </table>
      <h1>CI Bug Log - changes from XEIGT_8751_FULL -&gt;
        XEIGTPW_14543_FULL</h1>
      <h2>Summary</h2>
      <p><strong>FAILURE</strong></p>
      <p>Serious unknown changes coming with XEIGTPW_14543_FULL
        absolutely need to be<br>
        verified manually.</p>
      <p>If you think the reported changes have nothing to do with the
        changes<br>
        introduced in XEIGTPW_14543_FULL, please notify your bug team
        (<a class="moz-txt-link-abbreviated" href="mailto:I915-ci-infra@lists.freedesktop.org">I915-ci-infra@lists.freedesktop.org</a>) to allow them<br>
        to document this new failure mode, which will reduce false
        positives in CI.</p>
      <h2>Participating hosts (2 -&gt; 2)</h2>
      <p>No changes in participating hosts</p>
      <h2>Possible new issues</h2>
      <p>Here are the unknown changes that may have been introduced in
        XEIGTPW_14543_FULL:</p>
      <h3>IGT changes</h3>
      <h4>Possible regressions</h4>
      <ul>
        <li>
          <p>igt@kms_async_flips@alternate-sync-async-flip@pipe-c-edp-1:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8751/shard-lnl-3/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-edp-1.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-lnl-5/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-edp-1.html"
                moz-do-not-send="true">FAIL</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm_residency@aspm_link_residency:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8751/shard-bmg-7/igt@xe_pm_residency@aspm_link_residency.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-5/igt@xe_pm_residency@aspm_link_residency.html"
                moz-do-not-send="true">SKIP</a></li>
          </ul>
        </li>
      </ul>
    </blockquote>
    My change is entirely self contained within the intel_hdcp tool,
    code which is not used by any other test. So these regressions are
    unrelated to my change.<br>
    <br>
    John.<br>
    <br>
    <blockquote type="cite"
      cite="mid:177095893569.250939.16894445838167334699@a3b018990fe9">
      <ul>
        <li>
          <ul>
          </ul>
          <br>
        </li>
      </ul>
      <h2>New tests</h2>
      <p>New tests have been introduced between XEIGT_8751_FULL and
        XEIGTPW_14543_FULL:</p>
      <h3>New IGT tests (1)</h3>
      <ul>
        <li>igt@kms_flip@flip-vs-rmfb-interruptible@d-hdmi-a3:
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [3.94] s</li>
          </ul>
        </li>
      </ul>
      <h2>Known issues</h2>
      <p>Here are the changes found in XEIGTPW_14543_FULL that come from
        known issues:</p>
      <h3>IGT changes</h3>
      <h4>Issues hit</h4>
      <ul>
        <li>
          <p>igt@intel_hwmon@hwmon-write:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8751/shard-bmg-1/igt@intel_hwmon@hwmon-write.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-5/igt@intel_hwmon@hwmon-write.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4665"
                moz-do-not-send="true">Intel XE#4665</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_async_flips@alternate-sync-async-flip:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8751/shard-lnl-3/igt@kms_async_flips@alternate-sync-async-flip.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-lnl-5/igt@kms_async_flips@alternate-sync-async-flip.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718"
                moz-do-not-send="true">Intel XE#3718</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_async_flips@async-flip-with-page-flip-events-linear:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8751/shard-lnl-1/igt@kms_async_flips@async-flip-with-page-flip-events-linear.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-lnl-6/igt@kms_async_flips@async-flip-with-page-flip-events-linear.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5993"
                moz-do-not-send="true">Intel XE#5993</a>) +3 other tests
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370"
                moz-do-not-send="true">Intel XE#2370</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-5/igt@kms_big_fb@linear-32bpp-rotate-270.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327"
                moz-do-not-send="true">Intel XE#2327</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-lnl-1/igt@kms_big_fb@linear-8bpp-rotate-270.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407"
                moz-do-not-send="true">Intel XE#1407</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-8/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059"
                moz-do-not-send="true">Intel XE#7059</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124"
                moz-do-not-send="true">Intel XE#1124</a>) +9 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-16bpp-rotate-270:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-lnl-2/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124"
                moz-do-not-send="true">Intel XE#1124</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-lnl-8/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191"
                moz-do-not-send="true">Intel XE#2191</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-7/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314"
                moz-do-not-send="true">Intel XE#2314</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894"
                moz-do-not-send="true">Intel XE#2894</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@linear-tiling-2-displays-2160x1440p:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-6/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367"
                moz-do-not-send="true">Intel XE#367</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@linear-tiling-2-displays-2560x1440p:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-lnl-3/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367"
                moz-do-not-send="true">Intel XE#367</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs@pipe-a-edp-1:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-lnl-6/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs@pipe-a-edp-1.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669"
                moz-do-not-send="true">Intel XE#2669</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-lnl-4/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432"
                moz-do-not-send="true">Intel XE#3432</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432"
                moz-do-not-send="true">Intel XE#3432</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-lnl-7/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887"
                moz-do-not-send="true">Intel XE#2887</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-1/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887"
                moz-do-not-send="true">Intel XE#2887</a>) +13 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cdclk@mode-transition:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-7/igt@kms_cdclk@mode-transition.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724"
                moz-do-not-send="true">Intel XE#2724</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_color@degamma:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-10/igt@kms_chamelium_color@degamma.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325"
                moz-do-not-send="true">Intel XE#2325</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-lnl-3/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373"
                moz-do-not-send="true">Intel XE#373</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_hpd@dp-hpd-for-each-pipe:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-3/igt@kms_chamelium_hpd@dp-hpd-for-each-pipe.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252"
                moz-do-not-send="true">Intel XE#2252</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_sharpness_filter@filter-basic:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-6/igt@kms_chamelium_sharpness_filter@filter-basic.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6507"
                moz-do-not-send="true">Intel XE#6507</a>)</li>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-lnl-4/igt@kms_chamelium_sharpness_filter@filter-basic.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6507"
                moz-do-not-send="true">Intel XE#6507</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-10/igt@kms_content_protection@dp-mst-lic-type-1.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390"
                moz-do-not-send="true">Intel XE#2390</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974"
                moz-do-not-send="true">Intel XE#6974</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@dp-mst-type-0-hdcp14:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-8/igt@kms_content_protection@dp-mst-type-0-hdcp14.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974"
                moz-do-not-send="true">Intel XE#6974</a>)</li>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-lnl-2/igt@kms_content_protection@dp-mst-type-0-hdcp14.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974"
                moz-do-not-send="true">Intel XE#6974</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@dp-mst-type-1:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-lnl-4/igt@kms_content_protection@dp-mst-type-1.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307"
                moz-do-not-send="true">Intel XE#307</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974"
                moz-do-not-send="true">Intel XE#6974</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-1:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-5/igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-1.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304"
                moz-do-not-send="true">Intel XE#3304</a>) +2 other tests
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@uevent@pipe-a-dp-1:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-5/igt@kms_content_protection@uevent@pipe-a-dp-1.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707"
                moz-do-not-send="true">Intel XE#6707</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-offscreen-32x10:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-10/igt@kms_cursor_crc@cursor-offscreen-32x10.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320"
                moz-do-not-send="true">Intel XE#2320</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-lnl-4/igt@kms_cursor_crc@cursor-onscreen-512x170.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321"
                moz-do-not-send="true">Intel XE#2321</a>)</li>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-6/igt@kms_cursor_crc@cursor-onscreen-512x170.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321"
                moz-do-not-send="true">Intel XE#2321</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-5/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508"
                moz-do-not-send="true">Intel XE#1508</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_feature_discovery@psr2:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-6/igt@kms_feature_discovery@psr2.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374"
                moz-do-not-send="true">Intel XE#2374</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-nonexisting-fb:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-lnl-5/igt@kms_flip@2x-nonexisting-fb.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421"
                moz-do-not-send="true">Intel XE#1421</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8751/shard-bmg-3/igt@kms_flip@flip-vs-suspend-interruptible.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-1/igt@kms_flip@flip-vs-suspend-interruptible.html"
                moz-do-not-send="true">INCOMPLETE</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049"
                moz-do-not-send="true">Intel XE#2049</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597"
                moz-do-not-send="true">Intel XE#2597</a>) +1 other test
              incomplete</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178"
                moz-do-not-send="true">Intel XE#7178</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397"
                moz-do-not-send="true">Intel XE#1397</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745"
                moz-do-not-send="true">Intel XE#1745</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-default-mode:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-default-mode.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397"
                moz-do-not-send="true">Intel XE#1397</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178"
                moz-do-not-send="true">Intel XE#7178</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-6/igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179"
                moz-do-not-send="true">Intel XE#7179</a>)</li>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-lnl-6/igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179"
                moz-do-not-send="true">Intel XE#7179</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311"
                moz-do-not-send="true">Intel XE#2311</a>) +23 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141"
                moz-do-not-send="true">Intel XE#4141</a>) +10 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-mmap-wc:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-mmap-wc.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061"
                moz-do-not-send="true">Intel XE#7061</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-blt:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-blt.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061"
                moz-do-not-send="true">Intel XE#7061</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-render:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-render.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651"
                moz-do-not-send="true">Intel XE#651</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352"
                moz-do-not-send="true">Intel XE#2352</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656"
                moz-do-not-send="true">Intel XE#656</a>) +10 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313"
                moz-do-not-send="true">Intel XE#2313</a>) +28 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdr@invalid-hdr:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-4/igt@kms_hdr@invalid-hdr.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503"
                moz-do-not-send="true">Intel XE#1503</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_joiner@basic-force-ultra-joiner:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-6/igt@kms_joiner@basic-force-ultra-joiner.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911"
                moz-do-not-send="true">Intel XE#6911</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_joiner@basic-ultra-joiner:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-lnl-3/igt@kms_joiner@basic-ultra-joiner.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6900"
                moz-do-not-send="true">Intel XE#6900</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-6/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4090"
                moz-do-not-send="true">Intel XE#4090</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_panel_fitting@atomic-fastset:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-4/igt@kms_panel_fitting@atomic-fastset.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486"
                moz-do-not-send="true">Intel XE#2486</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-6/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7111"
                moz-do-not-send="true">Intel XE#7111</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7130"
                moz-do-not-send="true">Intel XE#7130</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7131"
                moz-do-not-send="true">Intel XE#7131</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping@pipe-b-plane-5:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-6/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping@pipe-b-plane-5.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7111"
                moz-do-not-send="true">Intel XE#7111</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7131"
                moz-do-not-send="true">Intel XE#7131</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-a-plane-0:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-7/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-a-plane-0.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7130"
                moz-do-not-send="true">Intel XE#7130</a>) +34 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-b-plane-5:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-7/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-b-plane-5.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7111"
                moz-do-not-send="true">Intel XE#7111</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7130"
                moz-do-not-send="true">Intel XE#7130</a>) +9 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier-source-clamping@pipe-a-plane-5:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-8/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier-source-clamping@pipe-a-plane-5.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7131"
                moz-do-not-send="true">Intel XE#7131</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane@pixel-format-yf-tiled-modifier@pipe-b-plane-5:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-lnl-7/igt@kms_plane@pixel-format-yf-tiled-modifier@pipe-b-plane-5.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7130"
                moz-do-not-send="true">Intel XE#7130</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_lowres@tiling-yf:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-5/igt@kms_plane_lowres@tiling-yf.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393"
                moz-do-not-send="true">Intel XE#2393</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_multiple@tiling-y:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-4/igt@kms_plane_multiple@tiling-y.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020"
                moz-do-not-send="true">Intel XE#5020</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-lnl-6/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886"
                moz-do-not-send="true">Intel XE#6886</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-6/igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886"
                moz-do-not-send="true">Intel XE#6886</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@dc6-psr:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-4/igt@kms_pm_dc@dc6-psr.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392"
                moz-do-not-send="true">Intel XE#2392</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@deep-pkgc:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-10/igt@kms_pm_dc@deep-pkgc.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505"
                moz-do-not-send="true">Intel XE#2505</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8751/shard-bmg-9/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-6/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7197"
                moz-do-not-send="true">Intel XE#7197</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-lnl-1/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406"
                moz-do-not-send="true">Intel XE#1406</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893"
                moz-do-not-send="true">Intel XE#2893</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608"
                moz-do-not-send="true">Intel XE#4608</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area@pipe-a-edp-1:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-lnl-1/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area@pipe-a-edp-1.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406"
                moz-do-not-send="true">Intel XE#1406</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608"
                moz-do-not-send="true">Intel XE#4608</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-3/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406"
                moz-do-not-send="true">Intel XE#1406</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489"
                moz-do-not-send="true">Intel XE#1489</a>) +8 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-4/igt@kms_psr2_su@page_flip-xrgb8888.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406"
                moz-do-not-send="true">Intel XE#1406</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387"
                moz-do-not-send="true">Intel XE#2387</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@pr-cursor-plane-move:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-lnl-4/igt@kms_psr@pr-cursor-plane-move.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406"
                moz-do-not-send="true">Intel XE#1406</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@psr2-primary-page-flip:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-3/igt@kms_psr@psr2-primary-page-flip.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406"
                moz-do-not-send="true">Intel XE#1406</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234"
                moz-do-not-send="true">Intel XE#2234</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850"
                moz-do-not-send="true">Intel XE#2850</a>) +9 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330"
                moz-do-not-send="true">Intel XE#2330</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-lnl-8/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414"
                moz-do-not-send="true">Intel XE#3414</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904"
                moz-do-not-send="true">Intel XE#3904</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414"
                moz-do-not-send="true">Intel XE#3414</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904"
                moz-do-not-send="true">Intel XE#3904</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_scaling_modes@scaling-mode-center:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-7/igt@kms_scaling_modes@scaling-mode-center.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413"
                moz-do-not-send="true">Intel XE#2413</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_setmode@invalid-clone-exclusive-crtc:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-10/igt@kms_setmode@invalid-clone-exclusive-crtc.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435"
                moz-do-not-send="true">Intel XE#1435</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_sharpness_filter@filter-toggle:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-3/igt@kms_sharpness_filter@filter-toggle.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503"
                moz-do-not-send="true">Intel XE#6503</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_tiled_display@basic-test-pattern:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426"
                moz-do-not-send="true">Intel XE#2426</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_tv_load_detect@load-detect:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-lnl-1/igt@kms_tv_load_detect@load-detect.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/330"
                moz-do-not-send="true">Intel XE#330</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@flipline:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-4/igt@kms_vrr@flipline.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499"
                moz-do-not-send="true">Intel XE#1499</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@lobf:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-9/igt@kms_vrr@lobf.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168"
                moz-do-not-send="true">Intel XE#2168</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8751/shard-lnl-5/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-lnl-4/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142"
                moz-do-not-send="true">Intel XE#2142</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_eudebug@basic-vm-access-userptr-faultable:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-lnl-4/igt@xe_eudebug@basic-vm-access-userptr-faultable.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837"
                moz-do-not-send="true">Intel XE#4837</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_eudebug@connect-user:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-3/igt@xe_eudebug@connect-user.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837"
                moz-do-not-send="true">Intel XE#4837</a>) +11 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_eudebug_online@breakpoint-many-sessions-single-tile:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-3/igt@xe_eudebug_online@breakpoint-many-sessions-single-tile.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837"
                moz-do-not-send="true">Intel XE#4837</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665"
                moz-do-not-send="true">Intel XE#6665</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-beng-cm-threads-small:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-lnl-6/igt@xe_evict@evict-beng-cm-threads-small.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688"
                moz-do-not-send="true">Intel XE#688</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-small-multi-queue:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-1/igt@xe_evict@evict-small-multi-queue.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7140"
                moz-do-not-send="true">Intel XE#7140</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322"
                moz-do-not-send="true">Intel XE#2322</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-lnl-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392"
                moz-do-not-send="true">Intel XE#1392</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-lnl-2/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136"
                moz-do-not-send="true">Intel XE#7136</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-imm:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-6/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-imm.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136"
                moz-do-not-send="true">Intel XE#7136</a>) +12 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_multi_queue@many-execs-priority:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-lnl-4/igt@xe_exec_multi_queue@many-execs-priority.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874"
                moz-do-not-send="true">Intel XE#6874</a>) +9 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-priority:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-9/igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-priority.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874"
                moz-do-not-send="true">Intel XE#6874</a>) +21 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_threads@threads-many-queues:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-9/igt@xe_exec_threads@threads-many-queues.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7166"
                moz-do-not-send="true">Intel XE#7166</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_threads@threads-multi-queue-mixed-basic:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-lnl-3/igt@xe_exec_threads@threads-multi-queue-mixed-basic.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138"
                moz-do-not-send="true">Intel XE#7138</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_threads@threads-multi-queue-mixed-userptr-invalidate:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-6/igt@xe_exec_threads@threads-multi-queue-mixed-userptr-invalidate.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138"
                moz-do-not-send="true">Intel XE#7138</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_mmap@small-bar:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-10/igt@xe_mmap@small-bar.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/586"
                moz-do-not-send="true">Intel XE#586</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_multigpu_svm@mgpu-latency-prefetch:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-7/igt@xe_multigpu_svm@mgpu-latency-prefetch.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964"
                moz-do-not-send="true">Intel XE#6964</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_oa@oa-tlb-invalidate:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-8/igt@xe_oa@oa-tlb-invalidate.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248"
                moz-do-not-send="true">Intel XE#2248</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pat@pat-index-xehpc:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-1/igt@xe_pat@pat-index-xehpc.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420"
                moz-do-not-send="true">Intel XE#1420</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@d3cold-i2c:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-3/igt@xe_pm@d3cold-i2c.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694"
                moz-do-not-send="true">Intel XE#5694</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s3-d3cold-basic-exec:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-lnl-3/igt@xe_pm@s3-d3cold-basic-exec.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284"
                moz-do-not-send="true">Intel XE#2284</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366"
                moz-do-not-send="true">Intel XE#366</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-8/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733"
                moz-do-not-send="true">Intel XE#4733</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_query@multigpu-query-invalid-query:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-3/igt@xe_query@multigpu-query-invalid-query.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944"
                moz-do-not-send="true">Intel XE#944</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_query@multigpu-query-invalid-size:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-lnl-6/igt@xe_query@multigpu-query-invalid-size.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944"
                moz-do-not-send="true">Intel XE#944</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_sriov_admin@bulk-sched-priority-vfs-disabled:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-lnl-2/igt@xe_sriov_admin@bulk-sched-priority-vfs-disabled.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7174"
                moz-do-not-send="true">Intel XE#7174</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8751/shard-bmg-3/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-3/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5937"
                moz-do-not-send="true">Intel XE#5937</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_sriov_flr@flr-twice:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-lnl-8/igt@xe_sriov_flr@flr-twice.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273"
                moz-do-not-send="true">Intel XE#4273</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_sriov_flr@flr-vf1-clear:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8751/shard-bmg-10/igt@xe_sriov_flr@flr-vf1-clear.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-5/igt@xe_sriov_flr@flr-vf1-clear.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569"
                moz-do-not-send="true">Intel XE#6569</a>)</li>
          </ul>
        </li>
      </ul>
      <h4>Possible fixes</h4>
      <ul>
        <li>
          <p>igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8751/shard-lnl-4/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6054"
                moz-do-not-send="true">Intel XE#6054</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-lnl-8/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html"
                moz-do-not-send="true">PASS</a> +3 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vblank@ts-continuation-dpms-rpm:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8751/shard-lnl-6/igt@kms_vblank@ts-continuation-dpms-rpm.html"
                moz-do-not-send="true">SKIP</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-lnl-2/igt@kms_vblank@ts-continuation-dpms-rpm.html"
                moz-do-not-send="true">PASS</a> +2 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-mlock-nomemset:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8751/shard-bmg-1/igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-mlock-nomemset.html"
                moz-do-not-send="true">ABORT</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7169"
                moz-do-not-send="true">Intel XE#7169</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-8/igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-mlock-nomemset.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s2idle-mocs:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8751/shard-lnl-6/igt@xe_pm@s2idle-mocs.html"
                moz-do-not-send="true">ABORT</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7169"
                moz-do-not-send="true">Intel XE#7169</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-lnl-6/igt@xe_pm@s2idle-mocs.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
      </ul>
      <h4>Warnings</h4>
      <ul>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8751/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html"
                moz-do-not-send="true">INCOMPLETE</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594"
                moz-do-not-send="true">Intel XE#2594</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178"
                moz-do-not-send="true">Intel XE#7178</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdr@brightness-with-hdr:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8751/shard-bmg-9/igt@kms_hdr@brightness-with-hdr.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544"
                moz-do-not-send="true">Intel XE#3544</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-5/igt@kms_hdr@brightness-with-hdr.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374"
                moz-do-not-send="true">Intel XE#3374</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544"
                moz-do-not-send="true">Intel XE#3544</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8751/shard-lnl-1/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439"
                moz-do-not-send="true">Intel XE#1439</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836"
                moz-do-not-send="true">Intel XE#836</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-lnl-4/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7197"
                moz-do-not-send="true">Intel XE#7197</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8751/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509"
                moz-do-not-send="true">Intel XE#2509</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14543/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426"
                moz-do-not-send="true">Intel XE#2426</a>)</li>
          </ul>
        </li>
      </ul>
      <h2>Build changes</h2>
      <ul>
        <li>IGT: IGT_8751 -&gt; IGTPW_14543</li>
        <li>Linux: xe-4544-2938ce73d01357a5816ed7dbd041154b58635a37
          -&gt; xe-4545-b4bfe7d753afaf6ea4950111a309a4e2ef5aef68</li>
      </ul>
      <p>IGTPW_14543: 14543<br>
        IGT_8751: af788251f1ef729d17c802aec2c4547b52059e58 @
        <a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/drm/igt-gpu-tools.git">https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</a><br>
        xe-4544-2938ce73d01357a5816ed7dbd041154b58635a37:
        2938ce73d01357a5816ed7dbd041154b58635a37<br>
        xe-4545-b4bfe7d753afaf6ea4950111a309a4e2ef5aef68:
        b4bfe7d753afaf6ea4950111a309a4e2ef5aef68</p>
    </blockquote>
    <br>
  </body>
</html>

--------------r0w1xrZjC0dmTNnAcYuxsEH7--
