Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 290F4CD4F54
	for <igt-dev@archiver.kernel.org>; Thu, 28 May 2026 17:21:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BADBB10F4B9;
	Thu, 28 May 2026 17:21:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="cIzaQ9P8";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45DD610F4B7
 for <igt-dev@lists.freedesktop.org>; Thu, 28 May 2026 17:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:From:References:To:Subject:MIME-Version:Date:
 Message-ID:Content-Type:Sender:Reply-To:Cc:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3wFamkmi5WBvAp+JuZ4Uab4zKwgtfL3ZHg3JQgRt0z0=; b=cIzaQ9P837FgZLzGdODMi1itFV
 gY5/pppmxgynqvZlT6hhavgUh/8R+IEeY2BqnBY0oUp6a5fuxq4ZzY354ljLE0pRcnkGk7dnXrzcR
 xUW07xI51faR1L6DbWd7220kP5O3AbjyVdnJraDmfJ60hM90I7iwkYs75Tjg/6AKZjPt9kQm6iuUa
 ATdgzcANYHfZb2Ml4ILyrwvtP91ZdsN9UoTQ1wrQ5zibLtRmHWGc8blxH0yfojahDR4KRX6Zo4+a2
 5qsjVpWbELQCED4OyIUNdWUO0ppt+bv4D98KFEaLuUBBE+a9KqWm2Ffz1v5H2/on/TQufdpvM1yfC
 lwYMAS6w==;
Received: from c-73-157-168-91.hsd1.or.comcast.net ([73.157.168.91]
 helo=[192.168.1.133]) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1wSeQB-009TIm-FK
 for <igt-dev@lists.freedesktop.org>; Thu, 28 May 2026 19:21:27 +0200
Content-Type: multipart/alternative;
 boundary="------------35imzcD8wcklgVF5TbT0WmMG"
Message-ID: <1a331f05-0b60-45de-8871-8d21cd6a0ef6@Igalia.com>
Date: Thu, 28 May 2026 10:21:24 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBYZS5DSS5CQVQ6IGZhaWx1cmUgZm9yIHRlc3RzL2ttc19j?=
 =?UTF-8?Q?olorop=3A_Assorted_fixes_and_support_for_i915/Xe_=28rev2=29?=
To: igt-dev@lists.freedesktop.org
References: <20260527193612.651624-1-John.Harrison@Igalia.com>
 <177992428297.18055.7691001171134181932@6beec6c84f66>
Content-Language: en-GB
From: John Harrison <John.Harrison@Igalia.com>
In-Reply-To: <177992428297.18055.7691001171134181932@6beec6c84f66>
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
--------------35imzcD8wcklgVF5TbT0WmMG
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/27/26 16:24, Patchwork wrote:
> Project List - Patchwork *Patch Details*
> *Series:* 	tests/kms_colorop: Assorted fixes and support for i915/Xe 
> (rev2)
> *URL:* 	https://patchwork.freedesktop.org/series/167234/
> *State:* 	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15264/index.html
>
>
>   CI Bug Log - changes from XEIGT_8939_BAT -> XEIGTPW_15264_BAT
>
>
>     Summary
>
> *FAILURE*
>
> Serious unknown changes coming with XEIGTPW_15264_BAT absolutely need 
> to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in XEIGTPW_15264_BAT, please notify your bug team 
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives 
> in CI.
>
>
>     Participating hosts (13 -> 2)
>
> ERROR: It appears as if the changes made in XEIGTPW_15264_BAT 
> prevented too many machines from booting.
>
> Missing (11): bat-bmg-1 bat-lnl-2 bat-lnl-1 bat-ptl-2 bat-ptl-vm 
> bat-ptl-1 bat-bmg-vm bat-bmg-3 bat-wcl-1 bat-bmg-2 bat-adlp-7
>
There does not appear to be any link to any serial console logs or 
similar to see why those systems did not boot correctly? However, my 
changes are just to three IGT tests not the kernel.
I'm not seeing how changing IGT tests can prevent a system from booting! 
So I'm pretty sure the above failures are some kind of CI issue and not 
related to this patch set.

John.


>     Changes
>
> No changes found
>
>
>     Build changes
>
>   * IGT: IGT_8939 -> IGTPW_15264
>   * Linux: xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb ->
>     xe-5139-7570b524ddecbe5db4af0c493a047e21bab6b3d6
>
> IGTPW_15264: 15264
> IGT_8939: 8939
> xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb: 
> 11a8456527f00d86dc8b23035c324da194fbbadb
> xe-5139-7570b524ddecbe5db4af0c493a047e21bab6b3d6: 
> 7570b524ddecbe5db4af0c493a047e21bab6b3d6
>

--------------35imzcD8wcklgVF5TbT0WmMG
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 5/27/26 16:24, Patchwork wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:177992428297.18055.7691001171134181932@6beec6c84f66">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>Project List - Patchwork</title>
      <style id="css-table-select" type="text/css">td { padding: 2pt; }</style>
      <b>Patch Details</b>
      <table>
        <tbody>
          <tr>
            <td><b>Series:</b></td>
            <td>tests/kms_colorop: Assorted fixes and support for
              i915/Xe (rev2)</td>
          </tr>
          <tr>
            <td><b>URL:</b></td>
            <td><a
                href="https://patchwork.freedesktop.org/series/167234/"
                moz-do-not-send="true" class="moz-txt-link-freetext">https://patchwork.freedesktop.org/series/167234/</a></td>
          </tr>
          <tr>
            <td><b>State:</b></td>
            <td>failure</td>
          </tr>
          <tr>
            <td><b>Details:</b></td>
            <td><a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15264/index.html"
                moz-do-not-send="true" class="moz-txt-link-freetext">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15264/index.html</a></td>
          </tr>
        </tbody>
      </table>
      <h1>CI Bug Log - changes from XEIGT_8939_BAT -&gt;
        XEIGTPW_15264_BAT</h1>
      <h2>Summary</h2>
      <p><strong>FAILURE</strong></p>
      <p>Serious unknown changes coming with XEIGTPW_15264_BAT
        absolutely need to be<br>
        verified manually.</p>
      <p>If you think the reported changes have nothing to do with the
        changes<br>
        introduced in XEIGTPW_15264_BAT, please notify your bug team
        (<a class="moz-txt-link-abbreviated" href="mailto:I915-ci-infra@lists.freedesktop.org">I915-ci-infra@lists.freedesktop.org</a>) to allow them<br>
        to document this new failure mode, which will reduce false
        positives in CI.</p>
      <h2>Participating hosts (13 -&gt; 2)</h2>
      <p>ERROR: It appears as if the changes made in XEIGTPW_15264_BAT
        prevented too many machines from booting.</p>
      <p>Missing (11): bat-bmg-1 bat-lnl-2 bat-lnl-1 bat-ptl-2
        bat-ptl-vm bat-ptl-1 bat-bmg-vm bat-bmg-3 bat-wcl-1 bat-bmg-2
        bat-adlp-7</p>
    </blockquote>
    There does not appear to be any link to any serial console logs or
    similar to see why those systems did not boot correctly? However, my
    changes are just to three IGT tests not the kernel. <br>
    I'm not seeing how changing IGT tests can prevent a system from
    booting! So I'm pretty sure the above failures are some kind of CI
    issue and not related to this patch set.<br>
    <br>
    John.<br>
    <br>
    <br>
    <blockquote type="cite"
      cite="mid:177992428297.18055.7691001171134181932@6beec6c84f66">
      <h2>Changes</h2>
      <p>No changes found</p>
      <h2>Build changes</h2>
      <ul>
        <li>IGT: IGT_8939 -&gt; IGTPW_15264</li>
        <li>Linux: xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb
          -&gt; xe-5139-7570b524ddecbe5db4af0c493a047e21bab6b3d6</li>
      </ul>
      <p>IGTPW_15264: 15264<br>
        IGT_8939: 8939<br>
        xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb:
        11a8456527f00d86dc8b23035c324da194fbbadb<br>
        xe-5139-7570b524ddecbe5db4af0c493a047e21bab6b3d6:
        7570b524ddecbe5db4af0c493a047e21bab6b3d6</p>
    </blockquote>
    <br>
  </body>
</html>

--------------35imzcD8wcklgVF5TbT0WmMG--
