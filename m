Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C764C3DA61
	for <igt-dev@archiver.kernel.org>; Mon, 29 Jul 2024 13:50:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6F4410E3EB;
	Mon, 29 Jul 2024 13:50:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dBOnDmg2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A177710E0BB;
 Mon, 29 Jul 2024 13:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722261025; x=1753797025;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to; bh=3it/c+XkgDmN7hHUH+QZEOVvBkq1nuun647uKH7mZb4=;
 b=dBOnDmg2lP7ju8EYlDCcM7pjc8quXTtYxFO7scDEbQV81LAOPca62FKE
 1JCtDd4peHeO9FpbEXw8/yb0TMW2969f8Xre4B5BGpZfnBP23f+eSNrUC
 RtstHX7FflILeu7NoBeWIaK7jcpPTHqlloqOpacQ8cvqwGs1NUYKNaY+h
 4bov0DCocqVPXlGae0diQbVXWe45namw98ioEHbpEmQxMjCXxwccl6wee
 h1CHgg+eelFwj/keouRHbacy3gadyWYg0l8gr/PPYcIu7VqfKPwhi8thQ
 lJKvdSf0hOcvTxz1XWqFt2695dIK5OrHYgZHrR1i/iKHpEfT7XCE3E3pr g==;
X-CSE-ConnectionGUID: N+Nvw7zbTE6OkixLn6ZppQ==
X-CSE-MsgGUID: OQs3OZffQvetKdXOQ1mj5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="31427502"
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; d="scan'208,217";a="31427502"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 06:50:25 -0700
X-CSE-ConnectionGUID: q23ILFObQX6MIov1sSG9sg==
X-CSE-MsgGUID: rpSti/yaS0W7+jykE/o3Aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; d="scan'208,217";a="54574993"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.246.30.61])
 ([10.246.30.61])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 06:50:24 -0700
Content-Type: multipart/alternative;
 boundary="------------LGZqySZV14ZwS3LMHRUs3osj"
Message-ID: <5139b312-a6a3-4bad-a96f-e55e17c831c3@intel.com>
Date: Mon, 29 Jul 2024 15:50:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_CI=2ExeFULL=3A_failure_for_lib/gpgpu=5Fsh?=
 =?UTF-8?Q?ader=3A_add_support_for_PVC_and_MTL?=
To: igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20240726-gpgpu_add_pvc_mtl-v1-1-b53cd1d3b5c8@intel.com>
 <172204518880.387507.14976184852013282739@2413ebb6fbb6>
Content-Language: en-US
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <172204518880.387507.14976184852013282739@2413ebb6fbb6>
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
--------------LGZqySZV14ZwS3LMHRUs3osj
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 27.07.2024 03:53, Patchwork wrote:
> Project List - Patchwork *Patch Details*
> *Series:* 	lib/gpgpu_shader: add support for PVC and MTL
> *URL:* 	https://patchwork.freedesktop.org/series/136568/
> *State:* 	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11478/index.html
>
>
>   CI Bug Log - changes from XEIGT_7940_full -> XEIGTPW_11478_full
>
>
>     Summary
>
> *FAILURE*
>
> Serious unknown changes coming with XEIGTPW_11478_full absolutely need 
> to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in XEIGTPW_11478_full, please notify your bug team 
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives 
> in CI.
>
>
>     Participating hosts (3 -> 3)
>
> No changes in participating hosts
>
>
>     Possible new issues
>
> Here are the unknown changes that may have been introduced in 
> XEIGTPW_11478_full:
>
>
>       IGT changes
>
>
>         Possible regressions
>
>   * igt@xe_pm@s2idle-vm-bind-userptr:
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7940/shard-dg2-436/igt@xe_pm@s2idle-vm-bind-userptr.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11478/shard-dg2-463/igt@xe_pm@s2idle-vm-bind-userptr.html>
>
>
>         Suppressed
>
> The following results come from untrusted machines, tests, or statuses.
> They do not affect the overall result.
>
>   * {igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p}:
>       o shard-lnl: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11478/shard-lnl-3/igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p.html>
>

Nothing related to the patch. The patched code is not used at all in 
these tests.

Regards
Andrzej

--------------LGZqySZV14ZwS3LMHRUs3osj
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body wd-tech="true" spellcheck="false">
    <br>
    <br>
    <div class="moz-cite-prefix">On 27.07.2024 03:53, Patchwork wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:172204518880.387507.14976184852013282739@2413ebb6fbb6">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>Project List - Patchwork</title>
      <style id="css-table-select" type="text/css">td { padding: 2pt; }</style>
      <b>Patch Details</b>
      <table>
        <tbody>
          <tr>
            <td><b>Series:</b></td>
            <td>lib/gpgpu_shader: add support for PVC and MTL</td>
          </tr>
          <tr>
            <td><b>URL:</b></td>
            <td><a
                href="https://patchwork.freedesktop.org/series/136568/"
                moz-do-not-send="true" class="moz-txt-link-freetext">https://patchwork.freedesktop.org/series/136568/</a></td>
          </tr>
          <tr>
            <td><b>State:</b></td>
            <td>failure</td>
          </tr>
          <tr>
            <td><b>Details:</b></td>
            <td><a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11478/index.html"
                moz-do-not-send="true" class="moz-txt-link-freetext">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11478/index.html</a></td>
          </tr>
        </tbody>
      </table>
      <h1>CI Bug Log - changes from XEIGT_7940_full -&gt;
        XEIGTPW_11478_full</h1>
      <h2>Summary</h2>
      <p><strong>FAILURE</strong></p>
      <p>Serious unknown changes coming with XEIGTPW_11478_full
        absolutely need to be<br>
        verified manually.</p>
      <p>If you think the reported changes have nothing to do with the
        changes<br>
        introduced in XEIGTPW_11478_full, please notify your bug team
        (<a class="moz-txt-link-abbreviated" href="mailto:I915-ci-infra@lists.freedesktop.org">I915-ci-infra@lists.freedesktop.org</a>) to allow them<br>
        to document this new failure mode, which will reduce false
        positives in CI.</p>
      <h2>Participating hosts (3 -&gt; 3)</h2>
      <p>No changes in participating hosts</p>
      <h2>Possible new issues</h2>
      <p>Here are the unknown changes that may have been introduced in
        XEIGTPW_11478_full:</p>
      <h3>IGT changes</h3>
      <h4>Possible regressions</h4>
      <ul>
        <li>igt@xe_pm@s2idle-vm-bind-userptr:
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7940/shard-dg2-436/igt@xe_pm@s2idle-vm-bind-userptr.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11478/shard-dg2-463/igt@xe_pm@s2idle-vm-bind-userptr.html"
                moz-do-not-send="true">DMESG-WARN</a></li>
          </ul>
        </li>
      </ul>
      <h4>Suppressed</h4>
      <p>The following results come from untrusted machines, tests, or
        statuses.<br>
        They do not affect the overall result.</p>
      <ul>
        <li>{igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p}:
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11478/shard-lnl-3/igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p.html"
                moz-do-not-send="true">DMESG-WARN</a></li>
          </ul>
        </li>
      </ul>
    </blockquote>
    <br>
    Nothing related to the patch. The patched code is not used at all in
    these tests.<br>
    <br>
    Regards<br>
    Andrzej<br>
    <br>
  </body>
</html>

--------------LGZqySZV14ZwS3LMHRUs3osj--
