Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3009CD5BD5
	for <igt-dev@archiver.kernel.org>; Thu, 28 May 2026 17:40:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CEDC10F253;
	Thu, 28 May 2026 17:40:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="TXk5GHDi";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9E9A10F253
 for <igt-dev@lists.freedesktop.org>; Thu, 28 May 2026 17:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:From:References:To:Subject:MIME-Version:Date:
 Message-ID:Content-Type:Sender:Reply-To:Cc:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Mn5ZlDlKMHXZ/PUcIXYdaClwuS4aUahCRlCJA5x9Jqo=; b=TXk5GHDiiqhEHdomaYg/Tr3HOV
 DcZxwDde4Lt4ATMOHrah1l81vFgwxXHKzUgaHue81z2ERP571AZEHfSQXXihryum0LyzBK3pbKGdQ
 KT+D/NjiAflXs+ACs0pJUMryk0WK4yhJynf97y9DsspaQzlv3itJfT688shisN3p4Odepj/boWGqL
 GoCLZ8rk0MMXOwTRK1uhLRTcalgEFszZ95Ed0MUNc6hHpVThHbMVBwJ1Gm7k30rhUcsJ1O5682gAh
 1wGL2W61MZfwxKmukgNBN550+JZOBgS2O1pukbzvtMpac8WVg+Ceb9ytWHcBPKPBohSjxL04BoQLk
 tMa9IVyQ==;
Received: from c-73-157-168-91.hsd1.or.comcast.net ([73.157.168.91]
 helo=[192.168.1.133]) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1wSeiO-009TpT-5H
 for <igt-dev@lists.freedesktop.org>; Thu, 28 May 2026 19:40:16 +0200
Content-Type: multipart/alternative;
 boundary="------------uv30KDwp2vKNiJxpRmteErbM"
Message-ID: <07e04b60-ff8e-4572-b42a-2be00d375871@Igalia.com>
Date: Thu, 28 May 2026 10:40:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_tests/kms?=
 =?UTF-8?Q?=5Fcolorop=3A_Assorted_fixes_and_support_for_i915/Xe_=28rev2=29?=
To: igt-dev@lists.freedesktop.org
References: <20260527193612.651624-1-John.Harrison@Igalia.com>
 <177992523324.18056.15970639131963694383@6beec6c84f66>
Content-Language: en-GB
From: John Harrison <John.Harrison@Igalia.com>
In-Reply-To: <177992523324.18056.15970639131963694383@6beec6c84f66>
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
--------------uv30KDwp2vKNiJxpRmteErbM
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/27/26 16:40, Patchwork wrote:
> Project List - Patchwork *Patch Details*
> *Series:* 	tests/kms_colorop: Assorted fixes and support for i915/Xe 
> (rev2)
> *URL:* 	https://patchwork.freedesktop.org/series/167234/
> *State:* 	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15264/index.html
>
>
>   CI Bug Log - changes from IGT_8939 -> IGTPW_15264
>
>
>     Summary
>
> *FAILURE*
>
> Serious unknown changes coming with IGTPW_15264 absolutely need to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_15264, please notify your bug team 
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives 
> in CI.
>
> External URL: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15264/index.html
>
>
>     Participating hosts (41 -> 8)
>
> ERROR: It appears as if the changes made in IGTPW_15264 prevented too 
> many machines from booting.
>
> Missing (33): fi-rkl-11600 bat-adlp-6 fi-snb-2520m fi-pnv-d510 
> fi-skl-6600u bat-mtlp-9 fi-bsw-n3050 bat-dg2-8 bat-dg2-9 fi-ilk-650 
> fi-hsw-4770 bat-atsm-1 fi-ivb-3770 fi-elk-e7500 bat-rplp-1 bat-rpls-4 
> bat-twl-1 bat-arls-5 fi-bsw-nick bat-arlh-2 bat-twl-2 bat-dg1-7 
> bat-arlh-3 bat-adlp-9 fi-cfl-8700k bat-dg1-6 bat-arls-6 bat-mtlp-8 
> bat-adlp-11 fi-cfl-guc fi-kbl-x1275 bat-dg2-14 bat-dg2-13
>
There does not appear to be any serial console logs or similar to see 
why those systems did not boot correctly? However, my changes are just 
to three IGT tests not the kernel.
I'm not seeing how changing IGT tests can prevent a system from booting! 
So I'm pretty sure the above failures are some kind of CI issue and not 
related to this patch set.

John.

>
>     Changes
>
> No changes found
>
>
>     Build changes
>
>   * CI: CI-20190529 -> None
>   * IGT: IGT_8939 -> IGTPW_15264
>   * Linux: CI_DRM_18562 -> CI_DRM_18563
>
> CI-20190529: 20190529
> CI_DRM_18562: 11a8456527f00d86dc8b23035c324da194fbbadb @ 
> git://anongit.freedesktop.org/gfx-ci/linux
> CI_DRM_18563: 7570b524ddecbe5db4af0c493a047e21bab6b3d6 @ 
> git://anongit.freedesktop.org/gfx-ci/linux
> IGTPW_15264: 15264
> IGT_8939: 8939
>

--------------uv30KDwp2vKNiJxpRmteErbM
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 5/27/26 16:40, Patchwork wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:177992523324.18056.15970639131963694383@6beec6c84f66">
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
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15264/index.html"
                moz-do-not-send="true" class="moz-txt-link-freetext">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15264/index.html</a></td>
          </tr>
        </tbody>
      </table>
      <h1>CI Bug Log - changes from IGT_8939 -&gt; IGTPW_15264</h1>
      <h2>Summary</h2>
      <p><strong>FAILURE</strong></p>
      <p>Serious unknown changes coming with IGTPW_15264 absolutely need
        to be<br>
        verified manually.</p>
      <p>If you think the reported changes have nothing to do with the
        changes<br>
        introduced in IGTPW_15264, please notify your bug team
        (<a class="moz-txt-link-abbreviated" href="mailto:I915-ci-infra@lists.freedesktop.org">I915-ci-infra@lists.freedesktop.org</a>) to allow them<br>
        to document this new failure mode, which will reduce false
        positives in CI.</p>
      <p>External URL:
        <a class="moz-txt-link-freetext" href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15264/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15264/index.html</a></p>
      <h2>Participating hosts (41 -&gt; 8)</h2>
      <p>ERROR: It appears as if the changes made in IGTPW_15264
        prevented too many machines from booting.</p>
      <p>Missing (33): fi-rkl-11600 bat-adlp-6 fi-snb-2520m fi-pnv-d510
        fi-skl-6600u bat-mtlp-9 fi-bsw-n3050 bat-dg2-8 bat-dg2-9
        fi-ilk-650 fi-hsw-4770 bat-atsm-1 fi-ivb-3770 fi-elk-e7500
        bat-rplp-1 bat-rpls-4 bat-twl-1 bat-arls-5 fi-bsw-nick
        bat-arlh-2 bat-twl-2 bat-dg1-7 bat-arlh-3 bat-adlp-9
        fi-cfl-8700k bat-dg1-6 bat-arls-6 bat-mtlp-8 bat-adlp-11
        fi-cfl-guc fi-kbl-x1275 bat-dg2-14 bat-dg2-13</p>
    </blockquote>
    There does not appear to be any serial console logs or similar to
    see why those systems did not boot correctly? However, my changes
    are just to three IGT tests not the kernel. <br>
    I'm not seeing how changing IGT tests can prevent a system from
    booting! So I'm pretty sure the above failures are some kind of CI
    issue and not related to this patch set.<br>
    <br>
    John.<br>
    <br>
    <blockquote type="cite"
      cite="mid:177992523324.18056.15970639131963694383@6beec6c84f66">
      <h2>Changes</h2>
      <p>No changes found</p>
      <h2>Build changes</h2>
      <ul>
        <li>CI: CI-20190529 -&gt; None</li>
        <li>IGT: IGT_8939 -&gt; IGTPW_15264</li>
        <li>Linux: CI_DRM_18562 -&gt; CI_DRM_18563</li>
      </ul>
      <p>CI-20190529: 20190529<br>
        CI_DRM_18562: 11a8456527f00d86dc8b23035c324da194fbbadb @
        <a class="moz-txt-link-freetext" href="git://anongit.freedesktop.org/gfx-ci/linux">git://anongit.freedesktop.org/gfx-ci/linux</a><br>
        CI_DRM_18563: 7570b524ddecbe5db4af0c493a047e21bab6b3d6 @
        <a class="moz-txt-link-freetext" href="git://anongit.freedesktop.org/gfx-ci/linux">git://anongit.freedesktop.org/gfx-ci/linux</a><br>
        IGTPW_15264: 15264<br>
        IGT_8939: 8939</p>
    </blockquote>
    <br>
  </body>
</html>

--------------uv30KDwp2vKNiJxpRmteErbM--
