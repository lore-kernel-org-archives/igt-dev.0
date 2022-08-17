Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A632C978C6
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Aug 2022 15:17:21 +0000 (UTC)
Date: Wed, 17 Aug 2022 18:16:15 +0300
From: Petri Latvala <petri.latvala@intel.com>
To: Jake Freeland <jake@technologyfriends.net>
Message-ID: <Yv0GP5W+KdcM8dji@platvala-desk.ger.corp.intel.com>
References: <20220816154750.1366623-1-jfree@freebsd.org>
 <20220817142129.1639394-1-jfree@freebsd.org>
 <CAOgZAGYZ29qV7URegwm_AtQ5nCk3uAY7xwu0uf+0NH559o7qvw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOgZAGYZ29qV7URegwm_AtQ5nCk3uAY7xwu0uf+0NH559o7qvw@mail.gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t 3/3] added newline to 'END TESTLIST' to
 comply with runner string comparison
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

On Wed, Aug 17, 2022 at 09:30:22AM -0500, Jake Freeland wrote:
> It appears that Patchwork is not picking up the second patch in revision 2:
> https://patchwork.freedesktop.org/series/107314/#rev2
> 
> Is there a way I can manually add the second patch?

You replied to patch 2, making patchwork think it's another version of
it. To add new patches they should be replies to patch 1. But then
there's the magic involved where patchwork tries to figure out whether
it's an additional patch or a new version of patch 1...

It's much simpler to just send the whole series as a whole. And please
squash patches 2+3 together, from a quick read 3 seems to be just
fixing patch 2.


-- 
Petri Latvala


> 
> Thank you,
> Jake Freeland
> 
> On Wed, Aug 17, 2022 at 9:23 AM Jake Freeland <jake@technologyfriends.net>
> wrote:
> 
> > ---
> >  scripts/code_cov_gen_report | 9 +++------
> >  tests/generate_testlist.sh  | 2 +-
> >  2 files changed, 4 insertions(+), 7 deletions(-)
> >
> > diff --git a/scripts/code_cov_gen_report b/scripts/code_cov_gen_report
> > index ffc8142e..b0696c51 100755
> > --- a/scripts/code_cov_gen_report
> > +++ b/scripts/code_cov_gen_report
> > @@ -138,8 +138,7 @@ if [ "$MODE" != "info" ]; then
> >                 echo "Creating per-file info files..."
> >                 echo -n "" >${MERGED_INFO}.info
> >                 for i in $RESULTS/*.tar.gz; do
> > -                       TITLE=$(basename $i)
> > -                       TITLE=$(basename $TITLE .tar.gz)
> > +                       TITLE=$(basename "$i" .tar.gz)
> >
> >                         echo "Adding results from $i..."
> >                         tar xf $i
> > @@ -155,8 +154,7 @@ if [ "$MODE" != "info" ]; then
> >
> >                 TITLE=${MERGED_INFO}
> >         else
> > -               TITLE=$(basename $RESULTS)
> > -               TITLE=$(basename $TITLE .tar.gz)
> > +               TITLE=$(basename "$RESULTS" .tar.gz)
> >
> >                 echo "Adding results from $RESULTS..."
> >                 tar xf $RESULTS
> > @@ -177,8 +175,7 @@ else
> >                 echo "Copying $RESULTS to $DEST_DIR..."
> >                 cp $RESULTS .
> >
> > -               TITLE=$(basename $RESULTS)
> > -               TITLE=$(basename $TITLE .info)
> > +               TITLE=$(basename "$RESULTS" .info)
> >         fi
> >  fi
> >
> > diff --git a/tests/generate_testlist.sh b/tests/generate_testlist.sh
> > index 240a7eb5..ea999a45 100755
> > --- a/tests/generate_testlist.sh
> > +++ b/tests/generate_testlist.sh
> > @@ -15,4 +15,4 @@ while [ $# -gt 0 ] ; do
> >         shift
> >  done
> >
> > -printf "\nEND TESTLIST" >> $OUTPUT
> > +printf "\nEND TESTLIST\n" >> $OUTPUT
> > --
> > 2.37.2
> >
> >
