Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57EB310E075
 for <igt-dev@lists.freedesktop.org>; Sat, 25 Mar 2023 03:09:00 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id i13so4555861lfe.9
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Mar 2023 20:09:00 -0700 (PDT)
Date: Sat, 25 Mar 2023 05:08:56 +0200
From: Petri Latvala <adrinael@adrinael.net>
Message-ID: <ZB5lyIqBKibgC5/C@adrinael.net>
References: <20230322072947.1760988-1-mauro.chehab@linux.intel.com>
 <ZBxRmoHBOIlnWqlB@adrinael.net>
 <20230323151537.75d5efe3@maurocar-mobl2>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230323151537.75d5efe3@maurocar-mobl2>
Subject: Re: [igt-dev] [PATCH i-g-t] intel-ci: update blacklists to work
 with the Xe driver
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Mar 23, 2023 at 03:15:37PM +0100, Mauro Carvalho Chehab wrote:
> On Thu, 23 Mar 2023 15:18:18 +0200
> Petri Latvala <adrinael@adrinael.net> wrote:
> 
> > On Wed, Mar 22, 2023 at 08:29:47AM +0100, Mauro Carvalho Chehab wrote:
> > > From: Mauro Carvalho Chehab <mchehab@kernel.org>
> > > 
> > > It doesn't make sense to run i915 tests with Xe driver and
> > > vice-versa. Update testlists to make it clear.
> > > 
> > > In order to avoid disrupts at exiting intel-ci tests, keep a
> > > symlink:
> > > 	i915-blacklist.txt -> blacklist.txt
> > > 
> > > Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> > > ---
> > >  tests/intel-ci/blacklist.txt      | 130 +----------------------------
> > >  tests/intel-ci/i915-blacklist.txt | 133 ++++++++++++++++++++++++++++++
> > >  tests/intel-ci/xe-blacklist.txt   |  21 +++++
> > >  3 files changed, 155 insertions(+), 129 deletions(-)
> > >  mode change 100644 => 120000 tests/intel-ci/blacklist.txt
> > >  create mode 100644 tests/intel-ci/i915-blacklist.txt
> > >  create mode 100644 tests/intel-ci/xe-blacklist.txt  
> > 
> > Since a rename is happening anyway, let's rename to inclusive language
> > at the same time? i915-blocklist.txt + xe-blocklist.txt
> 
> Currently, we have 2 such files:
> 
> 	tests/intel-ci/blacklist-pre-merge.txt
> 	tests/intel-ci/blacklist.txt
> 
> IMO, a rename from <blacklist> to whatever now-preferred namespace
> should touch both.
> 
> Yet, renames like that will break CI, so symlinks to the old names
> are required.
> 
> If you're ok with that, I can prepare an upcoming series with
> the renames, including renaming from "*blacklist*" to
> "*blocklist*" namespace and adding the needed symlinks to preserve
> CI from regressions.

Yeah, that sounds good. Get an ack from someone in the CI team as well
for it, just so they know in case something really weird breaks deeper
in the CI machinery.


-- 
Petri Latvala

