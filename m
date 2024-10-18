Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C26F9D30000
	for <igt-dev@archiver.kernel.org>; Fri, 18 Oct 2024 12:24:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74E8E10E8FB;
	Fri, 18 Oct 2024 12:24:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="COQqwn4i";
	dkim-atps=neutral
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com
 [209.85.128.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50F5510E8FF
 for <igt-dev@lists.freedesktop.org>; Fri, 18 Oct 2024 12:24:10 +0000 (UTC)
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-6e35bf59cf6so30444147b3.0
 for <igt-dev@lists.freedesktop.org>; Fri, 18 Oct 2024 05:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729254249; x=1729859049; darn=lists.freedesktop.org;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IRW+/mK44qkTqiw8jcsLwIZgL6IV5a87TYlGVdMXnbU=;
 b=COQqwn4ihki/uVxKKn8m7/Azw5kwbb9FcaqIaZVKw002P5Td8Ru5iluekkM34QZjFJ
 HC1fFHWCbcmcylz4OpvPAxCRmLG0QBSIXRd1QvZ58fhN4RrcvNs7UtfWAO7d42NvzueY
 m1D0QPTvDh4FcebqgmyIPoM51z4RukG5MHZbUKU+kHL9d0MHtU2cHoK99rm5XwReRmxJ
 2Ej19Uv4UOoWDcp8TbNEpbjiAoNgP3UehrQUslhVyHtqWSqKuFKaBHuJ2/SZXbYjOSNQ
 Q8yPIhO9VxcL7Lej8DDwSRtGMElTzPSavs7VAcVgA2wTQ2rKKZC705bJ61LxaVW1v/X1
 VreA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729254249; x=1729859049;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IRW+/mK44qkTqiw8jcsLwIZgL6IV5a87TYlGVdMXnbU=;
 b=oLeEu6rgLdoey8MW50rjhwAu3Vjgiwq/d0KbM6NiwSOZR8qJEtONpOW140TPO4R7ZL
 CX8VKhDiXuHrWPpC6y6RTmEjLluPNSLQG8hEYUZgGrr/SaOldhmMjVrQ7rRWUd4whp8L
 S+6dnwCoZlhgc/3PdjJXE+c277hNvK5bF5E10PWxD4onjryBxnGaTbKJ3AeHT0yQ/zMX
 84f9uuDM4utLo9JPhkrq+ilIyaCT7hOI53m/13aEt6ubrH7+ZU7jjOKAJ7tvnipKIWZ+
 cMe5/sKv677kiwGn+J93rFsoqgxbJxJTJ6oxjNZJCWYDciHbVfdMAtTksOpy99ACVr0q
 fQfw==
X-Gm-Message-State: AOJu0Ywuv7NJJbVgyIdXVS/P/rGGPDjL1tJgAkLKRa1UIYhSWVi0toXV
 F78Xw6VwsxZR7Pkoc8pKH7xQI7yZi15+k0wJe44ftr8qqfvhn/PzpDPMO+eVRfd05W8qzDMVLUT
 VHWi8naZoRNdT+6aJS/bUxSRt7hUjSyZKGkHQzHGs08hWJdGl
X-Google-Smtp-Source: AGHT+IFJQtysrznF3duSrDXKTgJ3g4Co/3VHlY1yLKPNX4Q1805+5Cm/roi1BNm2Gew5gAoZcjtcNWWXjHp22lBiosg=
X-Received: by 2002:a05:690c:46c3:b0:6e3:2dec:6b01 with SMTP id
 00721157ae682-6e5a3d2daadmr55273297b3.4.1729254249282; Fri, 18 Oct 2024
 05:24:09 -0700 (PDT)
MIME-Version: 1.0
References: <20241018120058.42240-1-dmitry.baryshkov@linaro.org>
 <172925377692.1281967.1529615205515048760@2413ebb6fbb6>
In-Reply-To: <172925377692.1281967.1529615205515048760@2413ebb6fbb6>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 18 Oct 2024 15:23:56 +0300
Message-ID: <CAA8EJpqmJQF2_DzSQMrUOdWOWXW9MGmC9rovm_GWy+5ZOb_zpA@mail.gmail.com>
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_GitLab=2EPipeline=3A_warning_for_tests=2Fkms=5Fprope?=
 =?UTF-8?Q?rties=3A_rework_immutability_checks_=28rev2=29?=
To: igt-dev@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Fri, 18 Oct 2024 at 15:16, Patchwork
<patchwork@emeril.freedesktop.org> wrote:
>
> =3D=3D Series Details =3D=3D
>
> Series: tests/kms_properties: rework immutability checks (rev2)
> URL   : https://patchwork.freedesktop.org/series/138114/
> State : warning
>
> =3D=3D Summary =3D=3D
>
> Pipeline status: FAILED.
>
> see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1292840=
 for the overview.
>
> build:tests-debian-minimal has failed (https://gitlab.freedesktop.org/gfx=
-ci/igt-ci-tags/-/jobs/65284355):

The test has failed on CI gating, not sure why. Could somebody
retrigger it please?

>   Fetching changes...
>   Reinitialized existing Git repository in /builds/gfx-ci/igt-ci-tags/.gi=
t/
>   Checking out f7eae05d as detached HEAD (ref is intel/IGTPW_11936)...
>   Removing build/
>   Removing lib/i915/perf-configs/__pycache__/
>   Removing lib/xe/oa-configs/__pycache__/
>   Removing scripts/__pycache__/
>
>   Skipping Git submodules setup
>   section_end:1729253314:get_sources
>   section_start:1729253314:step_script
>   Executing "step_script" stage of the job script
>   Using docker image sha256:08904a47f4efcc161569a9b7f88c458fc6e3e85a22251=
32246af9cf5cc6c4e5b for registry.freedesktop.org/gfx-ci/igt-ci-tags/build-d=
ebian-minimal:commit-f7eae05ddfe8770be21cc55fd2f5e56e5dc02bb6 with digest r=
egistry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-minimal@sha256:8b51=
a86fd81e64c501c9521c37fc8ad6f2550976931c510eb0ff4f6a328d477a ...
>   $ /host/bin/curl -s -L --cacert /host/ca-certificates.crt --retry 4 -f =
--retry-delay 60 https://gitlab.freedesktop.org/freedesktop/helm-gitlab-inf=
ra/-/raw/main/runner-gating/runner-gating.sh | sh
>   section_end:1729253335:step_script
>   section_start:1729253335:cleanup_file_variables
>   Cleaning up project directory and file based variables
>   section_end:1729253336:cleanup_file_variables
>   ERROR: Job failed: exit code 137
>
> =3D=3D Logs =3D=3D
>
> For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-=
/pipelines/1292840



--=20
With best wishes
Dmitry
