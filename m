Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0C9D10E075
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Aug 2023 17:21:12 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id
 ca18e2360f4ac-79241bb5807so1062739f.0
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Aug 2023 10:21:12 -0700 (PDT)
Date: Wed, 30 Aug 2023 11:21:09 -0600
From: Drew Davenport <ddavenport@chromium.org>
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Message-ID: <ZO96hWxy+3qZz3nd@chromium.org>
References: <20230828142356.1.I6b63e745635f9cad8c698001ce08f406fe0f0bcb@changeid>
 <eca45894-c8f2-1c4f-1454-3bfd0b6342d1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eca45894-c8f2-1c4f-1454-3bfd0b6342d1@gmail.com>
Subject: Re: [igt-dev] [PATCH] tests/kms_atomic_transition: Address test
 flakiness
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev <igt-dev@lists.freedesktop.org>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Juha-Pekka,

On Tue, Aug 29, 2023 at 10:01:54AM +0300, Juha-Pekka Heikkila wrote:
> Hi Drew,
> 
> can you show backtrace when the test failed for you? I was looking through
> stats how i915 have behaved with this and I didn't on brief look spot this
> ever hitting i915. Which driver you are seeing this issue with?

I see this test failing flakily on i915 and msm (I don't have recent
results on amdgpu but I suspect it would flake there too).

I don't have a backtrace, unfortunately, but the stack is:
igt_assert_eq
igt_display_commit_atomic
commit_display
run_modeset_tests

I've posted verbose logs on the issue I opened on gitlab and tagged you
there. Happy to dig further here or on the issue tracker.

> 
> Current stats on ci for i915 look like this (for me it look all green where
> run)
> 
> https://intel-gfx-ci.01.org/tree/drm-tip/shards-all.html?testfilter=kms_atomic_transition.*nonblocking
> 
> Here are some issues but they all did look like connector related issues:
> https://intel-gfx-ci.01.org/tree/drm-tip/drmtip.html?testfilter=kms_atomic_transition.*nonblocking
> 
> /Juha-Pekka
> 
> On 28.8.2023 23.23, Drew Davenport wrote:
> > Nonblocking commits can sometimes return -EBUSY. It's expected that
> > this error is transient and that userspace should retry the commit.
> > 
> > Since kms_atomic_transition uses nonblocking commits for some test
> > cases, the test fails flakily.
> > 
> > This change will handle -EBUSY to ensure that the test does not
> > fail in that case.
> > 
> > Closes: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/144
> > Signed-off-by: Drew Davenport <ddavenport@chromium.org>
> > 
> > ---
> > 
> >   tests/kms_atomic_transition.c | 6 +++++-
> >   1 file changed, 5 insertions(+), 1 deletion(-)
> > 
> > diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
> > index 6ab5267ca..46ce9f929 100644
> > --- a/tests/kms_atomic_transition.c
> > +++ b/tests/kms_atomic_transition.c
> > @@ -683,7 +683,11 @@ static void commit_display(data_t *data, unsigned event_mask, bool nonblocking)
> >   	if (nonblocking)
> >   		flags |= DRM_MODE_ATOMIC_NONBLOCK;
> > -	igt_display_commit_atomic(&data->display, flags, NULL);
> > +	do {
> > +		ret = igt_display_try_commit_atomic(&data->display, flags, NULL);
> > +	} while (ret == -EBUSY);
> > +
> > +	igt_assert_eq(ret, 0);
> >   	igt_debug("Event mask: %x, waiting for %i events\n", event_mask, num_events);
> 
