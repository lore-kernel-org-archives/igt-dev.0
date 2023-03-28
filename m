Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C6E210E8FE
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Mar 2023 14:46:26 +0000 (UTC)
Date: Tue, 28 Mar 2023 16:46:22 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Matthew Auld <matthew.william.auld@gmail.com>
Message-ID: <20230328144622.ta33hvq6y7v7yx4y@zkempczy-mobl2>
References: <20230327154359.91250-1-zbigniew.kempczynski@intel.com>
 <CAM0jSHOD0maP3ZrDZdCvtqec=29mcJruG7hXsWfn0NUDg_MHxg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAM0jSHOD0maP3ZrDZdCvtqec=29mcJruG7hXsWfn0NUDg_MHxg@mail.gmail.com>
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

On Tue, Mar 28, 2023 at 02:12:59PM +0100, Matthew Auld wrote:
> On Mon, 27 Mar 2023 at 16:44, Zbigniew Kempczyński
> <zbigniew.kempczynski@intel.com> wrote:
> >
> > From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
> >
> > Adding xeph_gpgpu_fillfunc to have gpgpu_fill running on XEPH (DG2).
> > On XEPH there's no GPGPU_WALK command, it has COMPUTE_WALK what requires
> > pipeline creation change.
> 
> Just a drive-by-comment, what is XEPH? Also in the patch itself. I
> have only ever seen XEHP and XELP. Is this a typo? s/PH/HP/ ?

You're right, XEHP should be there.

Don't ask me about rationale with using names instead of versioning
strings - it is out of my decision.

--
Zbigniew

> 
> >
> > Shader used in the test was taken from previous generation with
> > adding SWSB dependency tracking. SWSB was added using iga64 automatic
> > dependency generating:
> >
> > iga64 -p=12p5 -Xauto-deps shader.asm
> >
> > Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
> > Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
