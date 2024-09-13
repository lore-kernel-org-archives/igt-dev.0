Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED679FA374F
	for <igt-dev@archiver.kernel.org>; Fri, 13 Sep 2024 13:24:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8910310E25D;
	Fri, 13 Sep 2024 13:24:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JWZ5mfKU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 934BD10E25D
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Sep 2024 13:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726233860; x=1757769860;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=iAdRDl7VbEKYymwj0ZvK2qFH15KghS7fnBWcIhVLbp0=;
 b=JWZ5mfKUFL8QvVMwuQ/FDaOolHaKPBVXlHFWPTXjvDAxOSlcR4Jd8w4y
 0qxYdo0q5QSo8Z6Zmn+j8606udU1XaEgMmtFO5dBfNtIenYcfIPsTs0bn
 oT5U0vdlR2hP3z5KSEV+9M6e7JGgTKGtZsQo71rmRtBDuxCviZU7gePmz
 t3MP4kGBnH4kxV9XtzSeROpTy/a6p/RYIX/vAYWyhr20RdxpB8etdg7d3
 c2EPGUdm2clfWrgsNHcoR4EVTH8+KHZALMIShP5UZZ86D0zl+V55uQ+bV
 eQlHQXQmjFwTei66O3BTi9Wdte/6lWQvh1dBiI1b8faZtr5Q8dU3vtOBK w==;
X-CSE-ConnectionGUID: x7gDf0jJStuFdJJNwkfkuw==
X-CSE-MsgGUID: rg+n5TL2TlCNGH3j6oGnAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="24621598"
X-IronPort-AV: E=Sophos;i="6.10,226,1719903600"; d="scan'208";a="24621598"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2024 06:24:20 -0700
X-CSE-ConnectionGUID: WA0skH86TASfdQuZ7bX3aw==
X-CSE-MsgGUID: aDxIQKlrRXGtR7nRePTh5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,226,1719903600"; d="scan'208";a="67993027"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO [10.245.246.112])
 ([10.245.246.112])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2024 06:24:17 -0700
Message-ID: <8b34f7f2-8968-4bb9-be5a-d77a8e420f42@intel.com>
Date: Fri, 13 Sep 2024 15:24:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v6 12/17] scripts/igt_doc: Add '--exclude-files'
 parameter
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Maciej Patelczyk <maciej.patelczyk@intel.com>,
 =?UTF-8?Q?Dominik_Karol_Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>, Pawel Sikora <pawel.sikora@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Kolanupaka Naveena <kolanupaka.naveena@intel.com>,
 Mika Kuoppala <mika.kuoppala@intel.com>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 Jari Tahvanainen <jari.tahvanainen@intel.com>,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>
References: <20240905092812.94553-1-christoph.manszewski@intel.com>
 <20240905092812.94553-13-christoph.manszewski@intel.com>
 <20240909113125.ex5tvqjvnomavbv3@kamilkon-DESK.igk.intel.com>
 <20240909135742.sdv3s4fe2bmt6y4b@zkempczy-mobl2>
Content-Language: en-US
From: "Manszewski, Christoph" <christoph.manszewski@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20240909135742.sdv3s4fe2bmt6y4b@zkempczy-mobl2>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

Hi all,

On 9.09.2024 15:57, Zbigniew Kempczyński wrote:
> On Mon, Sep 09, 2024 at 01:31:25PM +0200, Kamil Konieczny wrote:
>> Hi Christoph,
>> On 2024-09-05 at 11:28:07 +0200, Christoph Manszewski wrote:
>>> Currently the doc scripts relies on a static list of files passed
>>> through the respective '<config>.json' file for generating
>>> documentation. This results in a compilation error when we exclude some
>>> tests from building since the doc script notices documentation generated
>>> for missing binaries.
>>>
>>> Make it possible to dynamically exclude files from doc generation using
>>> '--exclude-files' parameter. Merge excluded files passed with that parameter
>>> with files excluded from the test config '.json' files. Align the behavior
>>> of the '--files' parameter to also merge with files included from the config.
>>
>> Could we get rid of this option and instead check if there was
>> a binary file generated for a given C source file?
>> As I understand it, we could skip C source checks if there are
>> no binary generated.
> 
> I like this idea, I'll ask Christoph for drop exclude-files option and
> check corresponding .c files only if binary exists.

I already replied to Kamil's patch and will include it in this series 
instead of this one. Note however that this results in generating 
documentation for tests that weren't included in the build. I was 
specifically trying to avoid that but since Kamil suggests a change like 
this I guess it's fine.

Thanks,
Christoph
> 
> --
> Zbigniew
> 
>>
>> Or are there any other constrains like tests planned?
>>
>> Adding Jari and Katarczyna on Cc.
>>
>> Cc: Jari Tahvanainen <jari.tahvanainen@intel.com>
>> Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
>>
>> Regards,
>> Kamil
>>
>>>
>>> Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
>>> Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
>>> ---
>>>   scripts/igt_doc.py   |  3 +++
>>>   scripts/test_list.py | 47 +++++++++++++++++++++++++-------------------
>>>   2 files changed, 30 insertions(+), 20 deletions(-)
>>>
>>> diff --git a/scripts/igt_doc.py b/scripts/igt_doc.py
>>> index fa2c2c7ca..9b7317feb 100755
>>> --- a/scripts/igt_doc.py
>>> +++ b/scripts/igt_doc.py
>>> @@ -313,6 +313,8 @@ def main():
>>>                           help="Generate testlists for Intel CI integration at the INTELCI_TESTLIST directory.")
>>>       parser.add_argument('--files', nargs='+',
>>>                           help="File name(s) to be processed")
>>> +    parser.add_argument('--exclude-files', nargs='+',
>>> +                        help="File name(s) to ignore")
>>>   
>>>       parse_args = parser.parse_args()
>>>   
>>> @@ -325,6 +327,7 @@ def main():
>>>           tests = IgtTestList(config_fname = config,
>>>                               include_plan = parse_args.include_plan,
>>>                               file_list = parse_args.files,
>>> +                            exclude_file_list = parse_args.exclude_files,
>>>                               igt_build_path = parse_args.igt_build_path)
>>>   
>>>           if parse_args.filter_field:
>>> diff --git a/scripts/test_list.py b/scripts/test_list.py
>>> index 69c830ca1..4fe209e5a 100644
>>> --- a/scripts/test_list.py
>>> +++ b/scripts/test_list.py
>>> @@ -250,7 +250,7 @@ class TestList:
>>>                    config_dict = None, sources_path = None,
>>>                    test_tag = "TEST", subtest_tag = "SUBTESTS?",
>>>                    main_name = "igt", planned_name = "planned",
>>> -                 subtest_separator = "@"):
>>> +                 subtest_separator = "@", exclude_file_list = None):
>>>           self.doc = {}
>>>           self.test_number = 0
>>>           self.config = None
>>> @@ -368,28 +368,35 @@ class TestList:
>>>           if "_properties_" in self.props:
>>>               del self.props["_properties_"]
>>>   
>>> -        has_implemented = False
>>> +        if not exclude_file_list:
>>> +            exclude_file_list = []
>>> +        else:
>>> +            exclude_file_list = [os.path.normpath(f) for f in exclude_file_list]
>>> +
>>> +        exclude_file_glob = self.config.get("exclude_files", [])
>>> +        for cfg_file in exclude_file_glob:
>>> +            cfg_file = cfg_path + cfg_file
>>> +            for fname in glob.glob(cfg_file):
>>> +                exclude_file_list.append(fname)
>>> +
>>>           if not self.filenames:
>>>               self.filenames = []
>>> -            exclude_files = []
>>> -            files = self.config["files"]
>>> -            exclude_file_glob = self.config.get("exclude_files", [])
>>> -            for cfg_file in exclude_file_glob:
>>> -                cfg_file = cfg_path + cfg_file
>>> -                for fname in glob.glob(cfg_file):
>>> -                    exclude_files.append(fname)
>>> -
>>> -            for cfg_file in files:
>>> -                cfg_file = cfg_path + cfg_file
>>> -                for fname in glob.glob(cfg_file):
>>> -                    if fname in exclude_files:
>>> -                        continue
>>> -                    self.filenames.append(fname)
>>> -                    has_implemented = True
>>>           else:
>>> -            for cfg_file in self.filenames:
>>> -                if cfg_file:
>>> -                    has_implemented = True
>>> +            self.filenames = [os.path.normpath(f) for f in self.filenames]
>>> +
>>> +        files = self.config["files"]
>>> +        for cfg_file in files:
>>> +            cfg_file = cfg_path + cfg_file
>>> +            for fname in glob.glob(cfg_file):
>>> +                if fname in exclude_file_list:
>>> +                    continue
>>> +                self.filenames.append(fname)
>>> +
>>> +        has_implemented = False
>>> +        for cfg_file in self.filenames:
>>> +            if cfg_file:
>>> +                has_implemented = True
>>> +                break
>>>   
>>>           has_planned = False
>>>           if include_plan and "planning_files" in self.config:
>>> -- 
>>> 2.34.1
>>>
