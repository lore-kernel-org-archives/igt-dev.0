Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5975110E2EF
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Mar 2023 13:13:28 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id g17so15776612lfv.4
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Mar 2023 06:13:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230327154359.91250-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20230327154359.91250-1-zbigniew.kempczynski@intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Tue, 28 Mar 2023 14:12:59 +0100
Message-ID: <CAM0jSHOD0maP3ZrDZdCvtqec=29mcJruG7hXsWfn0NUDg_MHxg@mail.gmail.com>
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [igt-dev] [PATCH i-g-t] lib/gpgpu_fill: Implement
 gpgpu_fillfunc for XEPH
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

On Mon, 27 Mar 2023 at 16:44, Zbigniew Kempczy=C5=84ski
<zbigniew.kempczynski@intel.com> wrote:
>
> From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
>
> Adding xeph_gpgpu_fillfunc to have gpgpu_fill running on XEPH (DG2).
> On XEPH there's no GPGPU_WALK command, it has COMPUTE_WALK what requires
> pipeline creation change.

Just a drive-by-comment, what is XEPH? Also in the patch itself. I
have only ever seen XEHP and XELP. Is this a typo? s/PH/HP/ ?

>
> Shader used in the test was taken from previous generation with
> adding SWSB dependency tracking. SWSB was added using iga64 automatic
> dependency generating:
>
> iga64 -p=3D12p5 -Xauto-deps shader.asm
>
> Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
> Signed-off-by: Zbigniew Kempczy=C5=84ski <zbigniew.kempczynski@intel.com>
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
