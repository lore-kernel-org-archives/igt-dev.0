Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com
 [IPv6:2607:f8b0:4864:20::b2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1973F10EC3B
 for <igt-dev@lists.freedesktop.org>; Fri,  4 Mar 2022 08:45:20 +0000 (UTC)
Received: by mail-yb1-xb2e.google.com with SMTP id t7so11980611ybi.8
 for <igt-dev@lists.freedesktop.org>; Fri, 04 Mar 2022 00:45:20 -0800 (PST)
MIME-Version: 1.0
References: <20220303090507.grenwdro7u4fzmoe@houat>
 <YiCeCeNobS2FCiQB@intel.com>
In-Reply-To: <YiCeCeNobS2FCiQB@intel.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Fri, 4 Mar 2022 08:45:07 +0000
Message-ID: <CAPj87rOjof_WMT32G3-mb-ukVmOxVWJfXEVB4hYbUj0_VCV6ng@mail.gmail.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [igt-dev] Mandatory Test Suite for KMS Drivers?
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, Maxime Ripard <maxime@cerno.tech>,
 dri-devel@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi,

On Thu, 3 Mar 2022 at 10:53, Rodrigo Vivi <rodrigo.vivi@intel.com> wrote:
> On Thu, Mar 03, 2022 at 10:05:07AM +0100, Maxime Ripard wrote:
> > Back at XDC we floated the idea of creating a test suite for IGT that we
> > expect any KMS driver to pass, similar to what v4l2-compliance and
> > cec-compliance provide for v4l2 and CEC respectively.
> >
> > I was looking at the list of tests, and it's fairly massive, so it's not
> > clear to me what tests we could start this suite with. I can only assume
> > all the KMS (but the chamelium ones) and fbdev related ones would be a
> > good start?
> >
> > What do you think?
>
> I believe we should start with the group of the tests that we know that
> are reliably passing today on most of the platforms and then increase
> the list as the tests and drivers become more reliable.
>
> For instance, many of these would be candidate to be filtered out for now
> https://intel-gfx-ci.01.org/tree/drm-next/index.html?testfilter=kms
>
> compared to the whole view of kms tests:
> https://intel-gfx-ci.01.org/tree/drm-next/shards-all.html?testfilter=kms

We are running some of IGT on Panfrost + amdgpu + i915 as part of
KernelCI as well: go to https://linux.kernelci.org/test/ and search
for 'igt-gpu'. This gets run for mainline, next, and whatever other
kernel trees push into i915.

There is a Grafana-based dashboard that the KernelCI team have been
working on to visualise test runs, but it's currently having some
backend issues so I can't show you a link for that. I did raise a
suggestion in their design discussion for a proper testing dashboard
for making it easier to see the status, so feel free to pile in there:
https://github.com/kernelci/kernelci-project/discussions/28#discussioncomment-2293696

Cheers,
Daniel
