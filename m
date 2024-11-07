Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2687FD43374
	for <igt-dev@archiver.kernel.org>; Thu,  7 Nov 2024 15:55:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7F6010E727;
	Thu,  7 Nov 2024 15:55:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J1grWQjm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A28FF10E727
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Nov 2024 15:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730994956; x=1762530956;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=sGD4OaMch4iCkheyV+Gm+64Zi1rOCRKhX5S5DW3Hpto=;
 b=J1grWQjmIrx0U2pcfG7Rf4QgZJfv25MpQpWCmTCm57+9jJKv47VBPBFY
 TShsgztED6sDxFeiElsq9CgoVhBhdmSaC2mOZ1OEOJPYP/3ZDW8oMH8zW
 PF8wLAffo4PtoZ5t3t0dc549blp1fuyJNeAfc4MoHeTEAnRJQtPOHJPX/
 7tpgmdbwFmfuURloGGb6h1WkE8MaF/5L/WKnNtAfw535eV7t4pQvnJZMz
 EkTgK1npVJgpyjwVaftE8D4q63xRcleHL6wwr08mKEHJgyRR+6EfEn8y3
 f8AKoIZpOOj4IMBBH4aXpGVLQyVG/f+b4b06d6hGcFei1fsvovDsC+ZX1 A==;
X-CSE-ConnectionGUID: kTJ5bwQNQ+6+JgdBJFLG1w==
X-CSE-MsgGUID: LyAaPtS5QbeF70LeYCxC4A==
X-IronPort-AV: E=McAfee;i="6700,10204,11249"; a="41465079"
X-IronPort-AV: E=Sophos;i="6.12,135,1728975600"; d="scan'208";a="41465079"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2024 07:55:53 -0800
X-CSE-ConnectionGUID: nW3QmbshQz+kZyhl8ZSx0Q==
X-CSE-MsgGUID: qiFqqQtQR4SRsBoylrkPsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,135,1728975600"; d="scan'208";a="89784518"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Nov 2024 07:55:52 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 7 Nov 2024 07:55:43 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 7 Nov 2024 07:55:43 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.49) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 7 Nov 2024 07:55:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=buZ8l/ZH+rmbeeshU807N4IilFN50Re/nUThjoSiOBODoI4xpkCetvDb9bFJC1fh+guhz/IxZHF0WKRkzapUakW+uqMYc+8aSzXh3wREGQdqYuG7WRHc9VgEqZ2TMc4Nq0i8QJWezRKELeQMZQcJ8br3lAK6OYc8MFbIgekC5CpdpUkBGtow24o7e4hBaDYB9+ZL9z/XIlSG00LJtQiAhnldaWtIFmmNBVdmKRNMsWQ3s8cjxvloCoZUR0JTpEcqyTHeHKGSNRaSSrdQKPl74Lqoq7oZQ+S/RTdxuymMZGzk+vSvYOfZwCqwE636hNUtswSqAgICKw2a7rbvqmUzCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XOgcYIlHy8wVpuI0l8Vb2LOEX617+vom/pIixxSxdfs=;
 b=a1wPWuT7yzLhxiqRpLd0cIlrvCT8I8q2M+pHXsR7SZObJSa/bfdH0re7mHEYaPh71AAgpOXJTgPMGPm2V6Z2icBBPM4deiaCUEWSRBM/P+QdSCh+jYUc84E4nvwISWX0wIFT3mMjxTe5730o2flklw6X1B5xGqb4oWrJe0nbT9HnqQm4cSZZtzaPjzwWakcAN0zG4DUiYootwLqR5S7kJDypA3wxtf+1/gTXR+C43AocPWbFkxK0CF09Mo+mZcNnS/ZczBPj4A7vZbUuqk9q6H+86NshmGSr9fsJ72ZL9G3YVY0lm7U/I/JxzncVaUwmSHILGEtNEAXs+otB6VgmlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ0PR11MB6719.namprd11.prod.outlook.com (2603:10b6:a03:478::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Thu, 7 Nov
 2024 15:55:40 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8137.018; Thu, 7 Nov 2024
 15:55:40 +0000
Date: Thu, 7 Nov 2024 09:55:38 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Peter Senna Tschudin <peter.senna@linux.intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Gustavo
 Sousa" <gustavo.sousa@intel.com>, Zbigniew =?utf-8?Q?Kempczy=C5=84ski?=
 <zbigniew.kempczynski@intel.com>, <ryszard.knop@intel.com>
Subject: Re: [PATCH i-g-t] igt-runner fact checking
Message-ID: <qkr5xhm23dbziwp53m2xwjciqeghfe4zdtlurnpgphyxplx5pk@dkwxqwdymu77>
References: <136a49f8-8173-47a8-ac5d-e62e972e1005@linux.intel.com>
 <tmbhd2nam5xibqejlcpqo53zeiv543jkfokfh4yly63yjhpqf7@ruf6limclqyh>
 <8029d6ce-2d38-40a6-a574-00b6607805d8@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8029d6ce-2d38-40a6-a574-00b6607805d8@linux.intel.com>
X-ClientProxiedBy: MW4PR03CA0343.namprd03.prod.outlook.com
 (2603:10b6:303:dc::18) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ0PR11MB6719:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f31eb73-1f0c-47ad-a255-08dcff44a115
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?WgeIyXXU3OR9HoNJrn+5W2Q7bPwCUazyhIO8P2bpDXuKZeRCVg8X7QxSnW?=
 =?iso-8859-1?Q?2jhn1GZ+5JC5TMOzhvYT6prYWe7VUaEhLNc6OHFyCe1x7hs/iKB4xy/jAZ?=
 =?iso-8859-1?Q?vZoDc8gT2b8iLgHNVRKijTLdVHlh/C0myHEZKyi0sQsBrySG64IFN5pUII?=
 =?iso-8859-1?Q?nxygN5aC+IxPhtcJk39nierr++uZD0VMCoDfkBgbguytTldO8JU8Y61vjC?=
 =?iso-8859-1?Q?Dlm1ialfLfDU5IoG28EFCguPlHM5Ml3i6OG0yLiJNQ7mEDDA5Y4F7ObzCv?=
 =?iso-8859-1?Q?UCJFDT1k5TGcwIC27JT4ms5EKT7CkG0WTEJlItwxaKfKMyP378wiIv7DGN?=
 =?iso-8859-1?Q?EbpxoW41JpM7UYBybn8k1nJ24DPQemqX/ysPf5MduFVoURDEf0NPreqDvA?=
 =?iso-8859-1?Q?h8dmAIUjymy2S9Xzx5C9rkdknI/GY1iLxprb4g/ejwtNzJKxBJIebLJqzC?=
 =?iso-8859-1?Q?nxc6cHZTPwhyYgBztDFhqpbLb7ODD+jGy4oSpImCqF9L/5yT16uYJsYGN2?=
 =?iso-8859-1?Q?yq8trQxVirag+1dTUBFZfe2PbfL6KjMG2YLnoDPCwNikyHzgJwEEfGngtu?=
 =?iso-8859-1?Q?czYCzdO81XZeqXeoisE4fIulEY1m2f7Ey1SfH9J413P6xwdiTV8VLIhhOc?=
 =?iso-8859-1?Q?B/B8LXwF+8ifqImP70QV5qY9lxV01TiXaoM6J0y9br0NWBmjj2j2YNJc94?=
 =?iso-8859-1?Q?5yozPI5Rxf0IY12cRWgndQ/LrbNLJoffoumcDSMmjAPrXYmdAtXUOz2tH3?=
 =?iso-8859-1?Q?+dMplLgZ+jkT1jzPN0KVeqiY64LWte5x2p2Hh1TdHp7DOZKiKWD9Ja4hOQ?=
 =?iso-8859-1?Q?e7SOUMaj3caueQ6twQPXcXcewj84o/9R7UJ8zc9JTArebTILd61p5wj3Jt?=
 =?iso-8859-1?Q?7P9/Vz70948iTZKSm3j9JXQYmSQnUKM5pU8lt6kZX29p13k2k9bVHxU35i?=
 =?iso-8859-1?Q?dWzVhVLaUFZbqFP/T15G6bjQt/sNJl/Ae31Mtb0N1llLcxTFfhMHwnW7VE?=
 =?iso-8859-1?Q?t+er5UuJRYlIT69F1cTGsRK4HYfWr/bSzXqj2Sc6Ghfzln5NXsj5G/jNry?=
 =?iso-8859-1?Q?xlkS9WYVqwXiT19Bjg1jpLzsz32nqVAhA75AH99GeVsNXcfK/O8WlNyvFJ?=
 =?iso-8859-1?Q?5L8LavL0tV8kbsnYbkGrZy0eJMTB6Hl78/c33/9dIyx7h/TtnUsbkGLToY?=
 =?iso-8859-1?Q?gXvUxhDOrRaLhiFMJYJTzOUIcWtqsAVzBiX9X6ahlxsMY8CnX9MWzFfIRH?=
 =?iso-8859-1?Q?L/+yThh4avsp0YeYSmG9Pmj01GSmwoL4zdiDjLrgEK84oe1QUqJXZot/5g?=
 =?iso-8859-1?Q?VnTf?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?gyQJB4WI/8PAToJUZi0U2UmIioN79GlPbR3Ve3kJFIVCrNWSUInyEY8PCM?=
 =?iso-8859-1?Q?9NdO28oXAtEGIU3AC5UJWrtx8Yey8YhsWykOjDVA7r2oCywV1UmGbBUp4z?=
 =?iso-8859-1?Q?pJZLe2c2XurGJxXuCSO8wwZip1Axh7OqPKf2f6Q2pHlNB+kcFRNzoLpNEf?=
 =?iso-8859-1?Q?TyiKboy64OvowAnyEC5Vp9ectbQez1dtv6dTVHqav+nj/a1CvbkY15sD2L?=
 =?iso-8859-1?Q?HIbGxHzdMYDryFTBYTjzb3H/rDcIpTq/VVJKIFou5XwzlgbLRRxfTuE96H?=
 =?iso-8859-1?Q?pLp0dHFu14vDSHxbnT/JkQX7wJQww81O5c1y7/WVFxhRwNLMwhl0lSm/Cr?=
 =?iso-8859-1?Q?fmGDhjhQn96HjrlG85MdHWCIj/I+BywVDgy3zRXehxKTShBDltHeJNl7oh?=
 =?iso-8859-1?Q?MDRg5/jXX1tc9GONpru3o5joR7oM/mp/EgVq1y4Rc/YruKG5Zd+dQM/QdE?=
 =?iso-8859-1?Q?kpsI6TdcQs776A1FEGX5ggcpijCAvZ66W1G+5xTbAYjEB4BJkSBEl2R3LF?=
 =?iso-8859-1?Q?Z8/GFQUkiOFha+yDe74kpMCEKA2ksIxBh6SlNf+A6ZyPo9UobYoqzH0lqx?=
 =?iso-8859-1?Q?9nlHqtTazvHrtKY0wOf7BgvQJBJXIuvju7wgQfz0dzOhNrezmRr1M9Qq/0?=
 =?iso-8859-1?Q?DZL4XNhKesjXXI39vPqAbM1iYnNvf1jLEdmOFztfqkTLQZ8+xSRf7QlYln?=
 =?iso-8859-1?Q?cV0yqAQIaIMQCsp0aapyLbPo1IUg+ZqMjMNRiscjd2e7dmIWZmQjeszM/5?=
 =?iso-8859-1?Q?1RderQraSbRdaY9zv2ccZXa8Dk8kzuwq2W/DRzYmA/rvqzb/S/IM3QOpKR?=
 =?iso-8859-1?Q?tqL6S2SKAACm9sDvKrBos8yRbiBFoZvoZWJ3zgWEUI6PBWJwn9Rs4V5JSP?=
 =?iso-8859-1?Q?0gFOjOfJv9Vxt+zRlKMLzQR/oWJhZg5/7t0XVA8NOrhsyfUQYc0QY9ntnd?=
 =?iso-8859-1?Q?Y5FAnyuDSAS2sfXiAzJByisd27FOaXweGtl9AdmN4VHJa2opASt9BQLHtD?=
 =?iso-8859-1?Q?HwbIDdINpYfiBPHnehzjgjEZVjmJFli4sNCaGHMlp2EePb/2SDJjwxexhV?=
 =?iso-8859-1?Q?VCFajNFkE+4Eh870/Ng2Po4g/q7LluPKUxULkIbWP3vkHjii0PA6iUycnD?=
 =?iso-8859-1?Q?DvmqUNS/3nbOytEdgbOjPBBLXThjx3zKX8b+Wwr02n7M3QNkkFXQfJKcHy?=
 =?iso-8859-1?Q?emsT9DmDmP/mJdXGxdtETEmInUY5d6liQ4zsGI2eAR0KERIuN01DGoXk40?=
 =?iso-8859-1?Q?JDtoDzrtj5NfmUR4s2TvNtaw5UPUDeIPLTGKOzu+D3NCzkZxWIs22Wv2FZ?=
 =?iso-8859-1?Q?VR97bhTyma+zehWinwI1sblcUZsnpzGsfpwYFesAQ0ntfnRzA9a6jy9EoE?=
 =?iso-8859-1?Q?w4zaj+QMgkTIbF/qHMm38KAyXn80BBi19Fda7U5at/fKWoAkWjTCb7mwWG?=
 =?iso-8859-1?Q?KlgDJDAIF3LZDJNGDaOy6z0wWYuwaM8LfERlMpR8g+BdeSYgYHGmsbpQi2?=
 =?iso-8859-1?Q?KMG+UJ+iwQUyRjx77pLWBt9eioY5XC5jzDx0gDOjiQhq8xdO5fz7F5rlUn?=
 =?iso-8859-1?Q?yGhiNX/QLsg0H/UksxshACZQGqZZt8U4KcMpHSuiCKcfiqyZQx7giQj+ya?=
 =?iso-8859-1?Q?Z0eJU2eYm/sf4EpM0qwAwk20QHqWtOUwDn4e5szRmuHoQN5K4v6I/xeQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f31eb73-1f0c-47ad-a255-08dcff44a115
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2024 15:55:40.7211 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b8Wy8IWu1A0X4tOJGxwRMv4+wggfqrRUVp++atbTAU0hy8Bea9gU5c4BgQQBN5rAETuLUgxTFQQdNMY+hhbI27whrL71c/PyLryLY/1lPIE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6719
X-OriginatorOrg: intel.com
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

+Ryszard to know if the CI part would be doable.

On Thu, Nov 07, 2024 at 08:18:52AM +0100, Peter Senna Tschudin wrote:
>>> +    scan_kernel_loaded_kmods(list, last_test);
>>
>>
>> So... igt_facts() hardcodes what is the info collected. Maybe we
>> should rather plug this into the hooks framework as part of
>> "built-in hooks".
>
>I do not follow what you are trying to communicate here. Also, please see what Zbigniew said here*. Facts are not test requirements, but the line is blurry. In the context here a fact is something in the environment that can change but that should not. An example is the disappearing GPU.

$ ./build/runner/igt_runner --help | grep -A1 hook
   --hook HOOK_STR
                         Forward HOOK_STR to the --hook option of each test.
   --help-hook
                         Show detailed usage information for --hook.

So... today we already have "generic support" for running arbitrary
things before/after each test/subtest/dynamic-subtest.

	$ cat << EOF > testlist.txt
	igt@xe_exec_basic@once-basic
	EOF
	$ chmod +x lspci.sh
	$ sudo ./build/runner/igt_runner \
		--hook 'post-subtest:lspci -vv -d 8086:*:03xx' \
		--test-list testlist.txt build/tests/ results/
	$ head -n4 results/0/out.txt
	03:00.0 VGA compatible controller: Intel Corporation DG2 [Arc A580] (rev 08) (prog-if 00 [VGA controller])
         Subsystem: Intel Corporation Device 1425
         Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
         Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-

So, instead of creating a separate thing called "igt_facts", what I'm
proposing is that we build this on top of the hooks and these "facts"
are simply built-in hooks that are commonly used. We may even keep them
as scripts rather than translate to C.

What I'd like is something liked this (with whatever name we decide):

	sudo ./build/runner/igt_runner --builtin-hooks lspci,drm-cards

which is a shorthand or equivalent to:

	sudo ./build/runner/igt_runner \
		--hook post-subtest:$PWD/scripts/built-in-hooks/lspci.sh \
		--hook post-subtest:$PWD/scripts/built-in-hooks/drm-cards.sh \
		--test-list testlist.txt build/tests/ results/

The cherry on top would be for CI to parse the cover letter and
enable those ondemand, so we only do that in CI when we want to:

/ci-built-in-hooks: lspci,drm-cards

Could also be:

/ci-hook: 'post-subtest:lspci -vv -d 8086:*:03xx'

(note that the current way we have is "Test-with:", but that is
problematic as it's then parsed as a git-trailer and added to the
patches by some tools)

Lucas De Marchi

>
>So I suggest we start with the hardcoded simple code to assess the potential value of these facts. If the facts turns out to be useful in helping us debug corner cases, then we evaluate how to extend it.
>
>Any other fact you want to add? Asking because I miss this code in our CI to debug two issues that are on my queue...
>
>>
>> This way it's easier to control what and when info is collected,
>> allowing developers (and CI) to pick and choose what gets executed.
>
>The original idea was to have static and dynamic facts. The dynamic idea suggested a convenient mechanism for each test to define facts as needed. Zbigniew did not appreciate the potential to bloating.
>
>>
>> +Gustavo
>>
>> Lucas De Marchi
>
>* - https://patchwork.freedesktop.org/patch/621849/?series=140566&rev=1
>
