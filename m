Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52C35E77173
	for <igt-dev@archiver.kernel.org>; Fri,  6 Dec 2024 07:24:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F12810E5F3;
	Fri,  6 Dec 2024 07:24:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="iPtmaMsp";
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB76110E5F3
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Dec 2024 07:24:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 124B55C72DE;
 Fri,  6 Dec 2024 07:23:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16845C4CED1;
 Fri,  6 Dec 2024 07:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733469870;
 bh=hKI3chH1igo1Xrs24I4U976WwJm5L/8q3rwckRty/Dk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=iPtmaMspXaxP1SCRoC1SNpwXf+N42I0eoUv9/rVA5x2WpknhA7TYxGYGWto2Bq8V2
 DCDwECUmNnfVuoI0m5xRjRzz9dq8o5P4NRyh83c5/d+NgjytbyJ4XVfGDwLrElYALr
 6yh3nFgr90plceC7fKYNhwr6RfMtkghwkltWtCCYp+NDdT6lnMMRjQrSkGFCHBwO5C
 JlZ9M0IpYfWbvMx27ZpYqYoxA2qwEdLUuDVp0VTjcnlpRb/flKPl2fwiJ5ZnKbZqmV
 cSqNrq+kpuH2YtT/vb3TR74fL8sAjus3YCnTo6qsaoXH2ziVi+58jXwbLnrFKKJMcP
 BDr01PAkrA/mg==
From: Maxime Ripard <mripard@kernel.org>
To: igt-dev@lists.freedesktop.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Maxime Ripard <mripard@kernel.org>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH i-g-t RESEND v3 0/2] tests/kms_properties: rework
 immutability checks
Date: Fri,  6 Dec 2024 08:24:25 +0100
Message-ID: <173346986166.831483.14698392158753288549.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241115-rework-imm-check-v3-0-e4077cf16816@linaro.org>
References: <20241115-rework-imm-check-v3-0-e4077cf16816@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Fri, 15 Nov 2024 23:18:57 +0200, Dmitry Baryshkov wrote:
> Following the discussion on IRC, it is actually an error to require that
> properties that can not be chaged are marked as immutable.
> 
> The DRM_MODE_PROP_IMMUTABLE defines more of the 'direction' of the
> property (whether it is set by the kernel or it is expected to be set by
> the userspace) rather than simply states that there is no way for the
> userspace to change the property.
> 
> [...]

Applied to git@gitlab.freedesktop.org:drm/igt-gpu-tools.git (master).

Thanks!
Maxime
