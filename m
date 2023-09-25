Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 284D510E1CE
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Sep 2023 08:08:57 +0000 (UTC)
Date: Mon, 25 Sep 2023 10:08:52 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Message-ID: <20230925100852.06d4c8f1@maurocar-mobl2>
In-Reply-To: <87ttrnq1vh.fsf@intel.com>
References: <20230921095248.74514-1-mauro.chehab@linux.intel.com>
 <87ttrnq1vh.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t] scripts/test_list.py: allow adding
 multiple testlist lines with same name
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

On Thu, 21 Sep 2023 13:03:46 +0300
Jani Nikula <jani.nikula@linux.intel.com> wrote:

> On Thu, 21 Sep 2023, Mauro Carvalho Chehab <mauro.chehab@linux.intel.com> wrote:
> > From: Mauro Carvalho Chehab <mchehab@kernel.org>
> >
> > Sometimes, multiple files may contain testlists and blocklists for
> > the same name.
> >
> > Add support for it by placing such lists on an array, and storing one
> > testlist dictionary per line.
> >
> > Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> > ---
> >  scripts/test_list.py             | 13 ++++++++-----
> >  tests/intel/kms_test_config.json | 22 +++++++++++-----------
> >  tests/intel/xe_test_config.json  | 12 ++++++------
> >  3 files changed, 25 insertions(+), 22 deletions(-)
> >
> > diff --git a/scripts/test_list.py b/scripts/test_list.py
> > index fdc3c1998d23..daca290a02bd 100644
> > --- a/scripts/test_list.py
> > +++ b/scripts/test_list.py
> > @@ -333,16 +333,18 @@ class TestList:
> >              # Read testlist files if any
> >              if "testlists" in item["_properties_"]:
> >                  testlist = {}
> > -                for name in item["_properties_"]["testlists"].keys():
> > -                    self.read_testlist(testlist, name, cfg_path + item["_properties_"]["testlists"][name])
> > +                for value in item["_properties_"]["testlists"]:
> > +                    for name in value.keys():
> > +                        self.read_testlist(testlist, name, cfg_path + value[name])
> >  
> >                  item["_properties_"]["testlist"] = testlist
> >  
> >              # Read blocklist files if any
> >              if "blocklists" in item["_properties_"]:
> >                  blocklist = {}
> > -                for name in item["_properties_"]["blocklists"].keys():
> > -                    self.read_testlist(blocklist, name, cfg_path + item["_properties_"]["blocklists"][name])
> > +                for value in item["_properties_"]["blocklists"]:
> > +                    for name in value.keys():
> > +                        self.read_testlist(testlist, name, cfg_path + value[name])
> >  
> >                  item["_properties_"]["blocklist"] = blocklist
> >  
> > @@ -450,7 +452,8 @@ class TestList:
> >          base = r"^\s*({}[^\s\{}]+)(\S*)\s*(\#.*)?$"  
> 
> Just an unrelated thing that caught my eye. You can add names to groups
> with:
> 
> 	(?P<groupname>...)
> 
> and reference them by names instead of indices in the match object:
> 
> 	mo.group('groupname')
> 
> making the code ever so slightly easier to read.

Thanks for the tip.

I have mixed feelings about naming the groups at regex. I mean, it makes
easier to identify the match group based on its name, at the expense
of making the regular expression bigger (and, IMO harder) to read.

I mean, looking at the regex and counting parenthesis blocks is enough
to see what each block is seeking.

On this specific case, the code is:

	base = r"^\s*({}[^\s\{}]+)(\S*)\s*(\#.*)?$"
        regex = re.compile(base.format(self.main_name, self.subtest_separator))
	...
                match = regex.match(line)
                if match:
                    test = match.group(1)
                    subtest = match.group(2)
                    if not subtest.endswith("$"):
                        subtest += r"(\@.*)?$"
                    testlist[name].append(re.compile(f"{test}{subtest}"))


Looking at the parenthesis, we have:

	group 1: ({}[^\s\{}]+)
	group 2: (\S*)
	group 3: (\#.*)?  (not used by the match logic)

But the actual regex appear only after base.format(name, separator).
After that, group 1 actually becomes:

	group 1: (igt[^\s\@]+)

IMO, adding "P<group>" to each of the above will make harder to read
an already complex regex.

Also, just two groups are actually used at the match, and, for both,
a variable with the match name is used. IMO, in this specific example,
adding P<group> won't improve code readability.

-

Other than that, debugging and fixing complex regular expressions is 
hard. What I do when they're very complex is to test them via
regex101 (https://regex101.com/).

Regards,
Mauro
