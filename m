Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A930EECE57A
	for <igt-dev@archiver.kernel.org>; Mon,  9 Sep 2024 13:57:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60C8910E597;
	Mon,  9 Sep 2024 13:57:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jdk1IpvE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9127610E597
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Sep 2024 13:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725890269; x=1757426269;
 h=date:from:to:subject:message-id:references:mime-version:
 content-transfer-encoding:in-reply-to;
 bh=zR4eb57EPbprdLL0bF36yOF0SXDexfft5oOIOuQq7O4=;
 b=jdk1IpvEMHoto/2kPti1+bZXzjrQ+m5x2GuQzUU8g0cs0DD+QIEo+Ry/
 Dbo5YJFwmTNEZY/mscrSCwlu6tkugr2ilaHXYjKGuyzUPyuC1pySibJdO
 buZLBxKij8fHi0TPgFCHc5pyZ2EeYiRLlmhPuuQ6TtBm1QpaPoCGjhmbi
 T8Ftik+RgQlbMZRNmvXpuEVlVy8eeJG45rXSJkhqQOPNS0D7NVHhac1q2
 tkAeh8umCIalT3e2W0v8XZHIqOFZKqu0pESJ10MwtoabHSBe6VTBtf6j2
 D6h1pOr8GrQYSoT/+rJW2W0L6MUN/WFKY7D4uuiTUUISiY3tFbn00QcE8 w==;
X-CSE-ConnectionGUID: Tu9PJ2zLRAamQKljsUzBfQ==
X-CSE-MsgGUID: TtOPWuaYRHGZ/EtFnRWpEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="24749524"
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600"; d="scan'208";a="24749524"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2024 06:57:49 -0700
X-CSE-ConnectionGUID: 74qdmhJ4TPiZ8pdHEsDh9g==
X-CSE-MsgGUID: Ed4+z9k7R2ipanEVIUssFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600"; d="scan'208";a="97488745"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.214])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2024 06:57:46 -0700
Date: Mon, 9 Sep 2024 15:57:42 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Christoph Manszewski <christoph.manszewski@intel.com>,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Maciej Patelczyk <maciej.patelczyk@intel.com>,
 Dominik Karol =?utf-8?Q?Pi=C4=85tkowski?= <dominik.karol.piatkowski@intel.com>,
 Pawel Sikora <pawel.sikora@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Kolanupaka Naveena <kolanupaka.naveena@intel.com>,
 Mika Kuoppala <mika.kuoppala@intel.com>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 Jari Tahvanainen <jari.tahvanainen@intel.com>,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Subject: Re: [PATCH i-g-t v6 12/17] scripts/igt_doc: Add '--exclude-files'
 parameter
Message-ID: <20240909135742.sdv3s4fe2bmt6y4b@zkempczy-mobl2>
References: <20240905092812.94553-1-christoph.manszewski@intel.com>
 <20240905092812.94553-13-christoph.manszewski@intel.com>
 <20240909113125.ex5tvqjvnomavbv3@kamilkon-DESK.igk.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240909113125.ex5tvqjvnomavbv3@kamilkon-DESK.igk.intel.com>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

On Mon, Sep 09, 2024 at 01:31:25PM +0200, Kamil Konieczny wrote:
> Hi Christoph,
> On 2024-09-05 at 11:28:07 +0200, Christoph Manszewski wrote:
> > Currently the doc scripts relies on a static list of files passed
> > through the respective '<config>.json' file for generating
> > documentation. This results in a compilation error when we exclude some
> > tests from building since the doc script notices documentation generated
> > for missing binaries.
> > 
> > Make it possible to dynamically exclude files from doc generation using
> > '--exclude-files' parameter. Merge excluded files passed with that parameter
> > with files excluded from the test config '.json' files. Align the behavior
> > of the '--files' parameter to also merge with files included from the config.
> 
> Could we get rid of this option and instead check if there was
> a binary file generated for a given C source file?
> As I understand it, we could skip C source checks if there are
> no binary generated.

I like this idea, I'll ask Christoph for drop exclude-files option and
check corresponding .c files only if binary exists.

--
Zbigniew

> 
> Or are there any other constrains like tests planned?
> 
> Adding Jari and Katarczyna on Cc.
> 
> Cc: Jari Tahvanainen <jari.tahvanainen@intel.com>
> Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
> 
> Regards,
> Kamil
> 
> > 
> > Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
> > Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > ---
> >  scripts/igt_doc.py   |  3 +++
> >  scripts/test_list.py | 47 +++++++++++++++++++++++++-------------------
> >  2 files changed, 30 insertions(+), 20 deletions(-)
> > 
> > diff --git a/scripts/igt_doc.py b/scripts/igt_doc.py
> > index fa2c2c7ca..9b7317feb 100755
> > --- a/scripts/igt_doc.py
> > +++ b/scripts/igt_doc.py
> > @@ -313,6 +313,8 @@ def main():
> >                          help="Generate testlists for Intel CI integration at the INTELCI_TESTLIST directory.")
> >      parser.add_argument('--files', nargs='+',
> >                          help="File name(s) to be processed")
> > +    parser.add_argument('--exclude-files', nargs='+',
> > +                        help="File name(s) to ignore")
> >  
> >      parse_args = parser.parse_args()
> >  
> > @@ -325,6 +327,7 @@ def main():
> >          tests = IgtTestList(config_fname = config,
> >                              include_plan = parse_args.include_plan,
> >                              file_list = parse_args.files,
> > +                            exclude_file_list = parse_args.exclude_files,
> >                              igt_build_path = parse_args.igt_build_path)
> >  
> >          if parse_args.filter_field:
> > diff --git a/scripts/test_list.py b/scripts/test_list.py
> > index 69c830ca1..4fe209e5a 100644
> > --- a/scripts/test_list.py
> > +++ b/scripts/test_list.py
> > @@ -250,7 +250,7 @@ class TestList:
> >                   config_dict = None, sources_path = None,
> >                   test_tag = "TEST", subtest_tag = "SUBTESTS?",
> >                   main_name = "igt", planned_name = "planned",
> > -                 subtest_separator = "@"):
> > +                 subtest_separator = "@", exclude_file_list = None):
> >          self.doc = {}
> >          self.test_number = 0
> >          self.config = None
> > @@ -368,28 +368,35 @@ class TestList:
> >          if "_properties_" in self.props:
> >              del self.props["_properties_"]
> >  
> > -        has_implemented = False
> > +        if not exclude_file_list:
> > +            exclude_file_list = []
> > +        else:
> > +            exclude_file_list = [os.path.normpath(f) for f in exclude_file_list]
> > +
> > +        exclude_file_glob = self.config.get("exclude_files", [])
> > +        for cfg_file in exclude_file_glob:
> > +            cfg_file = cfg_path + cfg_file
> > +            for fname in glob.glob(cfg_file):
> > +                exclude_file_list.append(fname)
> > +
> >          if not self.filenames:
> >              self.filenames = []
> > -            exclude_files = []
> > -            files = self.config["files"]
> > -            exclude_file_glob = self.config.get("exclude_files", [])
> > -            for cfg_file in exclude_file_glob:
> > -                cfg_file = cfg_path + cfg_file
> > -                for fname in glob.glob(cfg_file):
> > -                    exclude_files.append(fname)
> > -
> > -            for cfg_file in files:
> > -                cfg_file = cfg_path + cfg_file
> > -                for fname in glob.glob(cfg_file):
> > -                    if fname in exclude_files:
> > -                        continue
> > -                    self.filenames.append(fname)
> > -                    has_implemented = True
> >          else:
> > -            for cfg_file in self.filenames:
> > -                if cfg_file:
> > -                    has_implemented = True
> > +            self.filenames = [os.path.normpath(f) for f in self.filenames]
> > +
> > +        files = self.config["files"]
> > +        for cfg_file in files:
> > +            cfg_file = cfg_path + cfg_file
> > +            for fname in glob.glob(cfg_file):
> > +                if fname in exclude_file_list:
> > +                    continue
> > +                self.filenames.append(fname)
> > +
> > +        has_implemented = False
> > +        for cfg_file in self.filenames:
> > +            if cfg_file:
> > +                has_implemented = True
> > +                break
> >  
> >          has_planned = False
> >          if include_plan and "planning_files" in self.config:
> > -- 
> > 2.34.1
> > 
