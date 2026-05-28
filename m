Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B375CD5BD5
	for <igt-dev@archiver.kernel.org>; Thu, 28 May 2026 17:19:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7ADBD10F4B7;
	Thu, 28 May 2026 17:19:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="H6t41bcO";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8392E10F4B5
 for <igt-dev@lists.freedesktop.org>; Thu, 28 May 2026 17:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:From:References:To:Subject:MIME-Version:Date:
 Message-ID:Content-Type:Sender:Reply-To:Cc:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yfqgonMqIUgfcZUYZywrFBQndw44qNoKQ8QpkmtRLnc=; b=H6t41bcOvhohWM4E9HnX44oeaY
 JrLwj+PTyd5BEK/iRCn7mDgGqt7K+JYS026hKl+7R1HA7U728H4QuiKZPsmZNntATCCoMf13OJ2OT
 vvCZ6CNVzUfpntfA/HGlMuL473izL1amuP6cpLCM2I7XBwq2jg84f3/S1/vaJw39A8Liqqe+zslpN
 P1onieGde+jgbvVmZr4ynFgxmHbLhCClIPoYR07DWQOvmsBmPFgtkQnM+XudI6YvWXtWjzaBj2Pfn
 7vTawwGhQGEpgWLRfypGlFG3Wqn0fu6icci89eMY51o4PSP1QvzL/CjGkJzUtO5eTpeYLwlRBwkaP
 LXEGDL+w==;
Received: from c-73-157-168-91.hsd1.or.comcast.net ([73.157.168.91]
 helo=[192.168.1.133]) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1wSeNc-009TEW-Bp
 for <igt-dev@lists.freedesktop.org>; Thu, 28 May 2026 19:18:48 +0200
Content-Type: multipart/alternative;
 boundary="------------lJlNg4Xo7fWVRXo0Pyeeo916"
Message-ID: <b09e2ade-dfe0-4b26-af35-2e6fb6144e56@Igalia.com>
Date: Thu, 28 May 2026 10:18:43 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBYZS5DSS5CQVQ6IGZhaWx1cmUgZm9yIHRlc3RzL2ttc19j?=
 =?UTF-8?Q?olorop=3A_Assorted_fixes_/_tweaks?=
To: igt-dev@lists.freedesktop.org
References: <20260527191839.639696-1-John.Harrison@Igalia.com>
 <177992019603.17308.2501558102556797863@6beec6c84f66>
Content-Language: en-GB
From: John Harrison <John.Harrison@Igalia.com>
In-Reply-To: <177992019603.17308.2501558102556797863@6beec6c84f66>
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
--------------lJlNg4Xo7fWVRXo0Pyeeo916
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/27/26 15:16, Patchwork wrote:
> Project List - Patchwork *Patch Details*
> *Series:* 	tests/kms_colorop: Assorted fixes / tweaks
> *URL:* 	https://patchwork.freedesktop.org/series/167408/
> *State:* 	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15262/index.html
>
>
>   CI Bug Log - changes from XEIGT_8939_BAT -> XEIGTPW_15262_BAT
>
>
>     Summary
>
> *FAILURE*
>
> Serious unknown changes coming with XEIGTPW_15262_BAT absolutely need 
> to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in XEIGTPW_15262_BAT, please notify your bug team 
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives 
> in CI.
>
>
>     Participating hosts (13 -> 13)
>
> No changes in participating hosts
>
>
>     Possible new issues
>
> Here are the unknown changes that may have been introduced in 
> XEIGTPW_15262_BAT:
>
>
>       IGT changes
>
>
>         Possible regressions
>
>  *
>
>     igt@xe_gt_freq@freq_range_idle:
>
>       o bat-wcl-1: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8939/bat-wcl-1/igt@xe_gt_freq@freq_range_idle.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15262/bat-wcl-1/igt@xe_gt_freq@freq_range_idle.html>
>         +1 other test skip
>  *
>
>     igt@xe_pm_residency@gt-c6-on-idle:
>
>       o bat-wcl-1: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8939/bat-wcl-1/igt@xe_pm_residency@gt-c6-on-idle.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15262/bat-wcl-1/igt@xe_pm_residency@gt-c6-on-idle.html>
>         +1 other test fail
>
My changes are entirely contained within the kms_colorop test and have 
no bearing on power management. The above issues are about not being 
able to enter (or just to detect entering?) C6 power state. So they are 
not related to this patch set.

John.


>     Build changes
>
>   * IGT: IGT_8939 -> IGTPW_15262
>   * Linux: xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb ->
>     xe-5139-7570b524ddecbe5db4af0c493a047e21bab6b3d6
>
> IGTPW_15262: 15262
> IGT_8939: 8939
> xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb: 
> 11a8456527f00d86dc8b23035c324da194fbbadb
> xe-5139-7570b524ddecbe5db4af0c493a047e21bab6b3d6: 
> 7570b524ddecbe5db4af0c493a047e21bab6b3d6
>

--------------lJlNg4Xo7fWVRXo0Pyeeo916
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 5/27/26 15:16, Patchwork wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:177992019603.17308.2501558102556797863@6beec6c84f66">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>Project List - Patchwork</title>
      <style id="css-table-select" type="text/css">td { padding: 2pt; }</style>
      <b>Patch Details</b>
      <table>
        <tbody>
          <tr>
            <td><b>Series:</b></td>
            <td>tests/kms_colorop: Assorted fixes / tweaks</td>
          </tr>
          <tr>
            <td><b>URL:</b></td>
            <td><a
                href="https://patchwork.freedesktop.org/series/167408/"
                moz-do-not-send="true" class="moz-txt-link-freetext">https://patchwork.freedesktop.org/series/167408/</a></td>
          </tr>
          <tr>
            <td><b>State:</b></td>
            <td>failure</td>
          </tr>
          <tr>
            <td><b>Details:</b></td>
            <td><a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15262/index.html"
                moz-do-not-send="true" class="moz-txt-link-freetext">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15262/index.html</a></td>
          </tr>
        </tbody>
      </table>
      <h1>CI Bug Log - changes from XEIGT_8939_BAT -&gt;
        XEIGTPW_15262_BAT</h1>
      <h2>Summary</h2>
      <p><strong>FAILURE</strong></p>
      <p>Serious unknown changes coming with XEIGTPW_15262_BAT
        absolutely need to be<br>
        verified manually.</p>
      <p>If you think the reported changes have nothing to do with the
        changes<br>
        introduced in XEIGTPW_15262_BAT, please notify your bug team
        (<a class="moz-txt-link-abbreviated" href="mailto:I915-ci-infra@lists.freedesktop.org">I915-ci-infra@lists.freedesktop.org</a>) to allow them<br>
        to document this new failure mode, which will reduce false
        positives in CI.</p>
      <h2>Participating hosts (13 -&gt; 13)</h2>
      <p>No changes in participating hosts</p>
      <h2>Possible new issues</h2>
      <p>Here are the unknown changes that may have been introduced in
        XEIGTPW_15262_BAT:</p>
      <h3>IGT changes</h3>
      <h4>Possible regressions</h4>
      <ul>
        <li>
          <p>igt@xe_gt_freq@freq_range_idle:</p>
          <ul>
            <li>bat-wcl-1: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8939/bat-wcl-1/igt@xe_gt_freq@freq_range_idle.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15262/bat-wcl-1/igt@xe_gt_freq@freq_range_idle.html"
                moz-do-not-send="true">SKIP</a> +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm_residency@gt-c6-on-idle:</p>
          <ul>
            <li>bat-wcl-1: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8939/bat-wcl-1/igt@xe_pm_residency@gt-c6-on-idle.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15262/bat-wcl-1/igt@xe_pm_residency@gt-c6-on-idle.html"
                moz-do-not-send="true">FAIL</a> +1 other test fail</li>
          </ul>
        </li>
      </ul>
    </blockquote>
    My changes are entirely contained within the kms_colorop test and
    have no bearing on power management. The above issues are about not
    being able to enter (or just to detect entering?) C6 power state. So
    they are not related to this patch set.<br>
    <br>
    John.<br>
    <br>
    <br>
    <blockquote type="cite"
      cite="mid:177992019603.17308.2501558102556797863@6beec6c84f66">
      <h2>Build changes</h2>
      <ul>
        <li>IGT: IGT_8939 -&gt; IGTPW_15262</li>
        <li>Linux: xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb
          -&gt; xe-5139-7570b524ddecbe5db4af0c493a047e21bab6b3d6</li>
      </ul>
      <p>IGTPW_15262: 15262<br>
        IGT_8939: 8939<br>
        xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb:
        11a8456527f00d86dc8b23035c324da194fbbadb<br>
        xe-5139-7570b524ddecbe5db4af0c493a047e21bab6b3d6:
        7570b524ddecbe5db4af0c493a047e21bab6b3d6</p>
    </blockquote>
    <br>
  </body>
</html>

--------------lJlNg4Xo7fWVRXo0Pyeeo916--
