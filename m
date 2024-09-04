Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FA4BCD3431
	for <igt-dev@archiver.kernel.org>; Wed,  4 Sep 2024 13:37:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C1F710E7CD;
	Wed,  4 Sep 2024 13:37:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="abwPPBca";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C63410E7CD
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Sep 2024 13:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725457075; x=1756993075;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=JXyz2NfHeC3iGOYjjXD5mbbiI9looncfPGMojTb84/s=;
 b=abwPPBcany82Re9V9LM2Kr/duTNL9D4EugIQEQ6OeiUcmiwikBEPIDJt
 /r+Zkt847OWFxVXEfsuPrmpflJiU6uwyy7FDmMtCjzJDf9mlB6iwhlHy2
 9VDOYeZbPKObZzDZ8JR7jcPj9dTQXjsMJpDSHBKJ4wSwdhanV6w+fgNSq
 A9g46BHmINqZQDiY2lFyJTF4xwZ/Md2CANQZP64fkQD0xW0NAweOZ7DVl
 DpbudyCemisN8/6OffYnW67zQNZ5VdtU1RfaHPOpOEoBVstPg/pCAS/tG
 bR9pSjSWSmAHpKy3UMsw2elYkKw/VO293MfK8McMdfKLc7jZiUQJJAHqO w==;
X-CSE-ConnectionGUID: yrJdxYjdS7O//gStwd51Zg==
X-CSE-MsgGUID: XU+IiQLrTc2gtQi+MIRNfg==
X-IronPort-AV: E=McAfee;i="6700,10204,11185"; a="24273533"
X-IronPort-AV: E=Sophos;i="6.10,202,1719903600"; d="scan'208";a="24273533"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2024 06:37:54 -0700
X-CSE-ConnectionGUID: oEbGe3y1TGO7asSd1fEbCw==
X-CSE-MsgGUID: 3L2pt3yzTOSSzk86h+1shA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,202,1719903600"; d="scan'208";a="69691786"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO [10.245.246.28])
 ([10.245.246.28])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2024 06:37:50 -0700
Message-ID: <09f55cf4-a27f-46b0-ae2e-7139a1039c20@intel.com>
Date: Wed, 4 Sep 2024 15:37:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v5 12/17] scripts/igt_doc: Add '--exclude-files'
 parameter
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Maciej Patelczyk <maciej.patelczyk@intel.com>,
 =?UTF-8?Q?Dominik_Karol_Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>, Pawel Sikora <pawel.sikora@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Kolanupaka Naveena <kolanupaka.naveena@intel.com>,
 Mika Kuoppala <mika.kuoppala@intel.com>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
References: <20240829144547.105371-1-christoph.manszewski@intel.com>
 <20240829144547.105371-13-christoph.manszewski@intel.com>
 <20240903065405.2jag47u3yk4djhgy@zkempczy-mobl2>
Content-Language: en-US
From: "Manszewski, Christoph" <christoph.manszewski@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20240903065405.2jag47u3yk4djhgy@zkempczy-mobl2>
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

Hi Zbigniew,

On 3.09.2024 08:54, Zbigniew Kempczyński wrote:
> On Thu, Aug 29, 2024 at 04:45:42PM +0200, Christoph Manszewski wrote:
>> Make it possible to exclude files using '--exclude-files' parameter.
>> Merge excluded files passed with that parameter with files excluded from the
>> test config '.json' files. Align the behavior of the '--files' parameter
>> to also merge with files included from the config.
>>
>> Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
> 
> This one looks good to me. I've tested it without and with xe_eudebug
> configuration and it works for both cases.
> 
> Only thing I would add to commit description is 'why' we need this
> change, I mean without explicit passing optional tests to be excluded
> doc generator will notice mismatch between those two lists.

Sure will do.

> 
> With above nit addressed:
> 
> Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

Thanks,
Christoph

> 
> --
> Zbigniew
> 
>> ---
>>   scripts/igt_doc.py   |  3 +++
>>   scripts/test_list.py | 47 +++++++++++++++++++++++++-------------------
>>   2 files changed, 30 insertions(+), 20 deletions(-)
>>
>> diff --git a/scripts/igt_doc.py b/scripts/igt_doc.py
>> index fa2c2c7ca..9b7317feb 100755
>> --- a/scripts/igt_doc.py
>> +++ b/scripts/igt_doc.py
>> @@ -313,6 +313,8 @@ def main():
>>                           help="Generate testlists for Intel CI integration at the INTELCI_TESTLIST directory.")
>>       parser.add_argument('--files', nargs='+',
>>                           help="File name(s) to be processed")
>> +    parser.add_argument('--exclude-files', nargs='+',
>> +                        help="File name(s) to ignore")
>>   
>>       parse_args = parser.parse_args()
>>   
>> @@ -325,6 +327,7 @@ def main():
>>           tests = IgtTestList(config_fname = config,
>>                               include_plan = parse_args.include_plan,
>>                               file_list = parse_args.files,
>> +                            exclude_file_list = parse_args.exclude_files,
>>                               igt_build_path = parse_args.igt_build_path)
>>   
>>           if parse_args.filter_field:
>> diff --git a/scripts/test_list.py b/scripts/test_list.py
>> index 69c830ca1..4fe209e5a 100644
>> --- a/scripts/test_list.py
>> +++ b/scripts/test_list.py
>> @@ -250,7 +250,7 @@ class TestList:
>>                    config_dict = None, sources_path = None,
>>                    test_tag = "TEST", subtest_tag = "SUBTESTS?",
>>                    main_name = "igt", planned_name = "planned",
>> -                 subtest_separator = "@"):
>> +                 subtest_separator = "@", exclude_file_list = None):
>>           self.doc = {}
>>           self.test_number = 0
>>           self.config = None
>> @@ -368,28 +368,35 @@ class TestList:
>>           if "_properties_" in self.props:
>>               del self.props["_properties_"]
>>   
>> -        has_implemented = False
>> +        if not exclude_file_list:
>> +            exclude_file_list = []
>> +        else:
>> +            exclude_file_list = [os.path.normpath(f) for f in exclude_file_list]
>> +
>> +        exclude_file_glob = self.config.get("exclude_files", [])
>> +        for cfg_file in exclude_file_glob:
>> +            cfg_file = cfg_path + cfg_file
>> +            for fname in glob.glob(cfg_file):
>> +                exclude_file_list.append(fname)
>> +
>>           if not self.filenames:
>>               self.filenames = []
>> -            exclude_files = []
>> -            files = self.config["files"]
>> -            exclude_file_glob = self.config.get("exclude_files", [])
>> -            for cfg_file in exclude_file_glob:
>> -                cfg_file = cfg_path + cfg_file
>> -                for fname in glob.glob(cfg_file):
>> -                    exclude_files.append(fname)
>> -
>> -            for cfg_file in files:
>> -                cfg_file = cfg_path + cfg_file
>> -                for fname in glob.glob(cfg_file):
>> -                    if fname in exclude_files:
>> -                        continue
>> -                    self.filenames.append(fname)
>> -                    has_implemented = True
>>           else:
>> -            for cfg_file in self.filenames:
>> -                if cfg_file:
>> -                    has_implemented = True
>> +            self.filenames = [os.path.normpath(f) for f in self.filenames]
>> +
>> +        files = self.config["files"]
>> +        for cfg_file in files:
>> +            cfg_file = cfg_path + cfg_file
>> +            for fname in glob.glob(cfg_file):
>> +                if fname in exclude_file_list:
>> +                    continue
>> +                self.filenames.append(fname)
>> +
>> +        has_implemented = False
>> +        for cfg_file in self.filenames:
>> +            if cfg_file:
>> +                has_implemented = True
>> +                break
>>   
>>           has_planned = False
>>           if include_plan and "planning_files" in self.config:
>> -- 
>> 2.34.1
>>
