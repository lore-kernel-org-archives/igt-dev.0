Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0665F10E0D8
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Oct 2023 15:15:00 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2b9d07a8d84so61301631fa.3
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Oct 2023 08:14:59 -0700 (PDT)
MIME-Version: 1.0
References: <20231019193321.90009-1-zbigniew.kempczynski@intel.com>
 <20231019193321.90009-6-zbigniew.kempczynski@intel.com>
In-Reply-To: <20231019193321.90009-6-zbigniew.kempczynski@intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Tue, 24 Oct 2023 16:14:30 +0100
Message-ID: <CAM0jSHN32XT_qbKByYCsaEyOKD88_DvdsaRgXAS=d5mYUvMcNg@mail.gmail.com>
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [igt-dev] [PATCH i-g-t v3 5/5] intel-ci/xe-fast-feedback: Add
 two xe_evict_ccs subtests for Xe run
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, 19 Oct 2023 at 20:33, Zbigniew Kempczy=C5=84ski
<zbigniew.kempczynski@intel.com> wrote:
>
> There are two subtests which should be run in bat.
> First is simple check of eviction, second exercises driver in multiple
> processes to check does any race influences on object consistency.
>
> Signed-off-by: Zbigniew Kempczy=C5=84ski <zbigniew.kempczynski@intel.com>
> Cc: Katarzyna Dec <katarzyna.dec@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
