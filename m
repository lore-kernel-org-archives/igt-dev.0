Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 635026E258
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Jun 2020 13:11:43 +0000 (UTC)
Date: Tue, 30 Jun 2020 16:11:30 +0300
From: "Lisovskiy, Stanislav" <stanislav.lisovskiy@intel.com>
Message-ID: <20200630131130.GA3618@intel.com>
References: <20200623135342.7046-1-stanislav.lisovskiy@intel.com>
 <79815182-5f59-cdb3-75da-741042273457@gmail.com>
 <1dff87a1-7636-86a6-d8fe-b31931327e85@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1dff87a1-7636-86a6-d8fe-b31931327e85@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] igt/tests: Clear pipes properly in
 kms_atomic_transition
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, juha-pekka.heikkila@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Jun 30, 2020 at 02:13:33PM +0200, Maarten Lankhorst wrote:
> Op 23-06-2020 om 17:07 schreef Juha-Pekka Heikkila:
> > On 23.6.2020 16.53, Stanislav Lisovskiy wrote:
> >> There is an issue happening from time to time in kms_atomic_transition
> >> (bug #1918). We periodically get assertion that some two outputs
> >> attempt to use same pipe like this:
> >>
> >> "Failed assertion: output->pending_pipe !=3D b->pending_pipe"
> >>
> >> After some investigation came to conclusion that this is happening
> >> because we are calling igt_output_set_pipe(output, PIPE_NONE) only
> >> for connected outputs, which is wrong.
> >> Periodically igt_display_refresh/igt_output_refresh call calls can
> >> update the output state to disconnected. However that doesn't clear
> >> the pipe being assigned(i.e output->pending_pipe).
> >> So this causes assertion to be triggered on next igt_display_refresh
> >> called during commit.
> >>
> >> Bugzilla: https://gitlab.freedesktop.org/drm/intel/-/issues/1918
> >>
> >> Signed-off-by: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
> >> ---
> >> =A0 tests/kms_atomic_transition.c | 5 +++--
> >> =A0 1 file changed, 3 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transiti=
on.c
> >> index 754a4969..a55388cd 100644
> >> --- a/tests/kms_atomic_transition.c
> >> +++ b/tests/kms_atomic_transition.c
> >> @@ -665,8 +665,9 @@ static unsigned set_combinations(igt_display_t *di=
splay, unsigned mask, struct i
> >> =A0=A0=A0=A0=A0 enum pipe pipe;
> >> =A0=A0=A0=A0=A0 unsigned event_mask =3D 0;
> >> =A0 -=A0=A0=A0 for_each_connected_output(display, output)
> >> -=A0=A0=A0=A0=A0=A0=A0 igt_output_set_pipe(output, PIPE_NONE);
> >> +=A0=A0=A0 for_each_pipe(display, pipe)
> >> +=A0=A0=A0=A0=A0=A0=A0 for_each_valid_output_on_pipe(display, pipe, ou=
tput)
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 igt_output_set_pipe(output, PIPE_NO=
NE);
> >> =A0 =A0=A0=A0=A0=A0 for_each_pipe(display, pipe) {
> >> =A0=A0=A0=A0=A0=A0=A0=A0=A0 igt_plane_t *plane =3D igt_pipe_get_plane_=
type(&display->pipes[pipe],
> >>
> >
> > Look ok to me.
> >
> > Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com> =

> =

> Nack, for_each_valid_output_on_pipe uses for_each_connected_output, so yo=
u keep the bug..
> =

> =A0=A0=A0 for (i =3D 0; i < display->n_outputs; i++)
> =A0=A0 =A0=A0=A0=A0 igt_output_set_pipe(&display->outputs[i], PIPE_NONE);=
 ?
> =

>

Good point, I was so much relying that it just doesn't do that.

Stan =

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
