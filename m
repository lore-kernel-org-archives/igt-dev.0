Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55150CA101E
	for <igt-dev@archiver.kernel.org>; Tue,  3 Sep 2024 06:54:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E3E410E3BE;
	Tue,  3 Sep 2024 06:54:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LQdkRRRz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9053410E3BE
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Sep 2024 06:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725346455; x=1756882455;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=2LKipt7xkDSl66vSdjGlW1ucr2q3CkAgLO32RFVFGX4=;
 b=LQdkRRRzJ8OiAvnoUZOn8ZpdD1BaqRa/XPcrgzJBBbZDTLQyAVttWZVR
 9dyqUAGMpv32PbBmY5CcyDe2s5BlumeyFXneiAJPG1FvZLf2nHxNxBq1p
 nDMngoycDPfWVdXtLodHF5/SG8HvbA6sO3sf+ekfWdh16wlGl6kYmYroZ
 oyT3bMpi1b2FXuULS7htOf30eE7LAhYyOWbEiqnJdmoor3h19eYoNuwKt
 mugz55EHidq5r73lqKo37KcYZlcaQWEV/XU/3lKG2ZV9sZUXIVNJsS7h7
 qpnROqyOdqx+8z5U5qXL6lp/yUW0ouvu35YdnryeFqxzMXekcGyxiRfwB A==;
X-CSE-ConnectionGUID: bG6PEpP2Qv+r7WFia7PTdQ==
X-CSE-MsgGUID: S4nfwwu1RW6gZUUuTMxf1A==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="24079998"
X-IronPort-AV: E=Sophos;i="6.10,197,1719903600"; d="scan'208";a="24079998"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2024 23:54:14 -0700
X-CSE-ConnectionGUID: kPTsH37HQkimBEmUHI+LcA==
X-CSE-MsgGUID: 6PPQohx4RbC6Id8g20rphA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,197,1719903600"; d="scan'208";a="69600306"
Received: from mklonows-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.116])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2024 23:54:11 -0700
Date: Tue, 3 Sep 2024 08:54:05 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Christoph Manszewski <christoph.manszewski@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Maciej Patelczyk <maciej.patelczyk@intel.com>,
 Dominik Karol =?utf-8?Q?Pi=C4=85tkowski?= <dominik.karol.piatkowski@intel.com>,
 Pawel Sikora <pawel.sikora@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Kolanupaka Naveena <kolanupaka.naveena@intel.com>,
 Mika Kuoppala <mika.kuoppala@intel.com>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Subject: Re: [PATCH i-g-t v5 12/17] scripts/igt_doc: Add '--exclude-files'
 parameter
Message-ID: <20240903065405.2jag47u3yk4djhgy@zkempczy-mobl2>
References: <20240829144547.105371-1-christoph.manszewski@intel.com>
 <20240829144547.105371-13-christoph.manszewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240829144547.105371-13-christoph.manszewski@intel.com>
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

On Thu, Aug 29, 2024 at 04:45:42PM +0200, Christoph Manszewski wrote:
> Make it possible to exclude files using '--exclude-files' parameter.
> Merge excluded files passed with that parameter with files excluded from the
> test config '.json' files. Align the behavior of the '--files' parameter
> to also merge with files included from the config.
> 
> Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>

This one looks good to me. I've tested it without and with xe_eudebug
configuration and it works for both cases.

Only thing I would add to commit description is 'why' we need this
change, I mean without explicit passing optional tests to be excluded
doc generator will notice mismatch between those two lists.

With above nit addressed:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

> ---
>  scripts/igt_doc.py   |  3 +++
>  scripts/test_list.py | 47 +++++++++++++++++++++++++-------------------
>  2 files changed, 30 insertions(+), 20 deletions(-)
> 
> diff --git a/scripts/igt_doc.py b/scripts/igt_doc.py
> index fa2c2c7ca..9b7317feb 100755
> --- a/scripts/igt_doc.py
> +++ b/scripts/igt_doc.py
> @@ -313,6 +313,8 @@ def main():
>                          help="Generate testlists for Intel CI integration at the INTELCI_TESTLIST directory.")
>      parser.add_argument('--files', nargs='+',
>                          help="File name(s) to be processed")
> +    parser.add_argument('--exclude-files', nargs='+',
> +                        help="File name(s) to ignore")
>  
>      parse_args = parser.parse_args()
>  
> @@ -325,6 +327,7 @@ def main():
>          tests = IgtTestList(config_fname = config,
>                              include_plan = parse_args.include_plan,
>                              file_list = parse_args.files,
> +                            exclude_file_list = parse_args.exclude_files,
>                              igt_build_path = parse_args.igt_build_path)
>  
>          if parse_args.filter_field:
> diff --git a/scripts/test_list.py b/scripts/test_list.py
> index 69c830ca1..4fe209e5a 100644
> --- a/scripts/test_list.py
> +++ b/scripts/test_list.py
> @@ -250,7 +250,7 @@ class TestList:
>                   config_dict = None, sources_path = None,
>                   test_tag = "TEST", subtest_tag = "SUBTESTS?",
>                   main_name = "igt", planned_name = "planned",
> -                 subtest_separator = "@"):
> +                 subtest_separator = "@", exclude_file_list = None):
>          self.doc = {}
>          self.test_number = 0
>          self.config = None
> @@ -368,28 +368,35 @@ class TestList:
>          if "_properties_" in self.props:
>              del self.props["_properties_"]
>  
> -        has_implemented = False
> +        if not exclude_file_list:
> +            exclude_file_list = []
> +        else:
> +            exclude_file_list = [os.path.normpath(f) for f in exclude_file_list]
> +
> +        exclude_file_glob = self.config.get("exclude_files", [])
> +        for cfg_file in exclude_file_glob:
> +            cfg_file = cfg_path + cfg_file
> +            for fname in glob.glob(cfg_file):
> +                exclude_file_list.append(fname)
> +
>          if not self.filenames:
>              self.filenames = []
> -            exclude_files = []
> -            files = self.config["files"]
> -            exclude_file_glob = self.config.get("exclude_files", [])
> -            for cfg_file in exclude_file_glob:
> -                cfg_file = cfg_path + cfg_file
> -                for fname in glob.glob(cfg_file):
> -                    exclude_files.append(fname)
> -
> -            for cfg_file in files:
> -                cfg_file = cfg_path + cfg_file
> -                for fname in glob.glob(cfg_file):
> -                    if fname in exclude_files:
> -                        continue
> -                    self.filenames.append(fname)
> -                    has_implemented = True
>          else:
> -            for cfg_file in self.filenames:
> -                if cfg_file:
> -                    has_implemented = True
> +            self.filenames = [os.path.normpath(f) for f in self.filenames]
> +
> +        files = self.config["files"]
> +        for cfg_file in files:
> +            cfg_file = cfg_path + cfg_file
> +            for fname in glob.glob(cfg_file):
> +                if fname in exclude_file_list:
> +                    continue
> +                self.filenames.append(fname)
> +
> +        has_implemented = False
> +        for cfg_file in self.filenames:
> +            if cfg_file:
> +                has_implemented = True
> +                break
>  
>          has_planned = False
>          if include_plan and "planning_files" in self.config:
> -- 
> 2.34.1
> 
