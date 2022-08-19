Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Fri, 19 Aug 2022 08:02:42 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Message-ID: <20220819080242.38b3382f@maurocar-mobl2>
In-Reply-To: <6809017.18pcnM708K@jkrzyszt-mobl1.ger.corp.intel.com>
References: <20220812095346.45379-1-janusz.krzysztofik@linux.intel.com>
 <20220817145348.562fcaa2@maurocar-mobl2>
 <6809017.18pcnM708K@jkrzyszt-mobl1.ger.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t 1/3] tests/gem_exec_fence:
 Fix wrong engine checked for store_dword capability
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Mauro Carvalho Chehab <mauro.carvalho.chehab@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, 18 Aug 2022 17:27:26 +0200
Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com> wrote:

> Hi Mauro,
> 
> Thanks for reviewing this series, I've just pushed it.
> 
> On Wednesday, 17 August 2022 14:53:48 CEST Mauro Carvalho Chehab wrote:
> > Hi Janusz,
> > 
> > On Fri, 12 Aug 2022 11:53:44 +0200
> > Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com> wrote:
> > 
> > It seems that there is a numeration issue on this series, as the patches
> > on it are:
> > 
> >    [PATCH i-g-t 1/3] tests/gem_exec_fence: Fix wrong engine checked for store_dword capability
> >    [PATCH i-g-t v2 2/3] tests/gem_exec_fence: Exclude 0  from use in store batches
> >    [PATCH i-g-t v3 3/3] tests/gem_exec_fence: Restore  pre-hang checks in *await-hang scenarios
> > 
> > Maybe some broken script? It is also missing a cover letter.  
> 
> That was not a script, I provided version numbers of individual patches 
> manually, and not provided any cover letter.  First patch was a small fix, not 
> directly related to the two others.  Second patch was a small enhancement, 
> also not directly related to the third one.  However, the third one depended 
> on the two for clean apply, and that was the only reason for me sending them 
> in series.
> 
> That said, let me ask, based on your huge upstream experience, what are your 
> preferences on patch version tagging if one is going to submit a series with 
> new versions of some patches while still including some other that don't need 
> to be changed?  Should all be marked as new (and the same) versions?

I guess you started without a cover letter because it was originally a 
single patch. Then, you realized that this was not enough, so you needed
extra stuff.

When I submit single fixes upstream, I usually don't add cover letters,
as the patch description is usually enough, but, at the moment it becomes
multiple (dependent) ones, I add it.

Yet, sometimes even for simple patch submissions, I add cover letters,
when I feel the need to add some explanation to help reviewers to analyze
it.

Basically:

- the cover letter provides temporary information meant to help reviewers
  and maintainers to understand the series. It includes, for instance:

  - a short summary of the patches in the tree;
  - on what tree/branch the patch applies, if not on upstream
    (like someone's else tree, next-20220819 branch, etc). 
  - any special instructions for the maintainers when applying it, like
    if the patch should be merged after some other series;
  - patch versions;
  - etc.

- the patch title and the body describes: why, what and how. Those should
  be providing enough understanding for anyone that would later look at
  the git logs to understand the changes applied there. Patch version
  log doesn't belong here. Yet, as patch reviews could be interesting
  even after things get merged, you can include a link to lore, in the
  form of:

	Link: https://lore.kernel.org/$mailing_list/$msg_id

  (instead of $mailing list, you could just use "all")

  So, for instance, if I want to place a pointer to the last e-mail
  on this thread, I would add:

	Link: https://lore.kernel.org/intel-gfx/6809017.18pcnM708K@jkrzyszt-mobl1.ger.corp.intel.com

  or:

	Link: https://lore.kernel.org/all/6809017.18pcnM708K@jkrzyszt-mobl1.ger.corp.intel.com

  Btw, on patches generated on git, the msg_id is there after format-email.
  So, you can even add links to the patch you're sending.

-

In cases like the one you described, I would be adding a cover letter
with something like:

	[PATCH i-g-t v3 0/3] Add some fixes to tests/gem_exec_fence

	some description about the series

	---

	v3:
	  - Added a patch to restore pre-hang checks;
	  - patches 1 and 2 unchanged.

	v2:
	  - Added a fix to exclude 0 in store batches;
 	  - patch 1 unchanged.

If you need a v4, add it before v3, and so on.

At the series itself, version numbers are incremented on all patches.
This makes clear for reviewers that already checked your series about
what changed and what remains the same.

I hope that helps.

Regards,
Mauro
