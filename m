Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEEF5C25B78
	for <igt-dev@archiver.kernel.org>; Thu, 16 May 2024 17:06:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D37A10E1F6;
	Thu, 16 May 2024 17:06:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PbjxdYvp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 561CB10E1AC
 for <igt-dev@lists.freedesktop.org>; Thu, 16 May 2024 17:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715879210; x=1747415210;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=QREl+EK21dvlbW5+9UcNf0QSg5+TvQ14LsJxtykAwCU=;
 b=PbjxdYvpOu7/U6CLwOSazxB3ay+c5lYmtFZvaa1DnCMAKGYeLQDeRL4M
 k3f7wsQqAHE1wA4R+jKFTAEgjUGw1jmNY0Y6jPFq9TydYFtq3urjhziQk
 Ex7fsdAlPG+jzzNRKdPMhxBZqnWJKOZxgxVPllSBfLXTJGzstDsZtxfoK
 3/idbMe2Io4wdK+CVYqA64QtJh6EO3KGi0Hvp++pyGTFVffABJ4uiWLQP
 0S0hVMERwtK1SrAjb0ksyFGC1kYmaU2xh4hBT+HCn/HpaCKV+6GjZhRo0
 4R7i4CEYQdHwdc3ffvZH77Mj5O2j59tVBJV8aDlzk+z6bnvhWRVN6ncr1 A==;
X-CSE-ConnectionGUID: AAzRr/7IT6aMgaZTbHTRkQ==
X-CSE-MsgGUID: IGwGj+gITOaqE9s3Qvt0zg==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="12135469"
X-IronPort-AV: E=Sophos;i="6.08,165,1712646000"; d="scan'208";a="12135469"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2024 10:06:49 -0700
X-CSE-ConnectionGUID: Cl8gGToJSlCC6C+ixvR97Q==
X-CSE-MsgGUID: LgC4mLuISz2xxR3o5ZgF6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,165,1712646000"; d="scan'208";a="54718130"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 May 2024 10:06:48 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 16 May 2024 10:05:52 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 16 May 2024 10:05:52 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 16 May 2024 10:05:52 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 16 May 2024 10:05:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EQPy91PPPz3oxtcGmGs8svnvyxs3nazYSPhIsJrudlSpwkW1N1uTOgQ/jtd8mx7vkEv5XCY1MoHUUcYKNhNUKsHneOv9SZSEPXNNkbTo52b8ZCdJ/hEYPJqzhlBqf9cmDJEzIv2fkmfynf0YozngS7NM68F6zfJlOt70dlXamLlt77PiZ78WEDV+VmYkExjVLk749psnN+GkYUG272NrcWwGXrnpZRWvbQNKAohviOUwZUK6/PH0U7e2gJ8h+LbmGP+b1rlfR1mbNb0H4eWJSohr3viG4zf23OJZPWLiLSRaV5gVGYnwa5K0vLaU2aars51pX+sExxA33vcWCmZi7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8QDTWIppbsePW5QAJv/ncaAPxTXRx/jVu1WQmv6nK4g=;
 b=H6PweDT0GVF2yImVyl0k3om6WLj29uvbpf59SnNlvxeFQMaaY1FKVYqC6+F4dj5ZcADtJSP/2ZkNtl1nBX1MrEuuYzX2uH9Yp9sMca5gkzQt79FfgcqITGltwzNXbR7ALKJQ8z0dj5ZtYdBqx7VS9CAWgxthmXb1drxSFV88Enby8o3exMI4kmT8avmj7qXHRiQ2epPBWFdUjp2kJonTvI318pHOUqkfUNLFswL7P5/rjaVaUunrO4kyzvmVp14/sw1tF7Fu3XkTN8CR/PVa+z+oBnercx88ViMV0CtyafM+ws+GcS2CPMRwcN3x9VfKGHnDmvetRBe8tEzGy0qenw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by DM4PR11MB7374.namprd11.prod.outlook.com (2603:10b6:8:102::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.27; Thu, 16 May
 2024 17:05:49 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%4]) with mapi id 15.20.7587.026; Thu, 16 May 2024
 17:05:49 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240516163047.sjd37ymn34uhsosd@kamilkon-DESK.igk.intel.com>
References: <20240509152442.189166-1-gustavo.sousa@intel.com>
 <20240509152442.189166-2-gustavo.sousa@intel.com>
 <20240515171055.dpqo3uarlappfux6@kamilkon-DESK.igk.intel.com>
 <171579455569.27300.4520939210308457020@gjsousa-mobl2>
 <20240516104058.llfw2vgdtn3txnpo@kamilkon-DESK.igk.intel.com>
 <171586196699.2995.10601085751736261998@gjsousa-mobl2>
 <20240516163047.sjd37ymn34uhsosd@kamilkon-DESK.igk.intel.com>
Subject: Re: [PATCH i-g-t 1/3] igt_hook: Add feature
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: Petri Latvala <adrinael@adrinael.net>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
Date: Thu, 16 May 2024 14:05:44 -0300
Message-ID: <171587914402.2995.7824695032745912706@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: SJ2PR07CA0010.namprd07.prod.outlook.com
 (2603:10b6:a03:505::27) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|DM4PR11MB7374:EE_
X-MS-Office365-Filtering-Correlation-Id: fcec74a4-8056-4af5-d34d-08dc75ca6f87
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UElqS2IzUVpCMTQ3dVp4Q3BoUDFtL2JVc084WFdNMzNadmRCQ3BVOWdHc1gv?=
 =?utf-8?B?OEpYT2paM0tlRkdEZWpsMWVmWEZFQndjVkp4S3RjTlZiQ3RxdDlIOHRRazA0?=
 =?utf-8?B?bmtIMEtuL3Z2Z0J0SW5wOHVRcG1mZE9yVWhsbkVYYnZFam1PYnFrNWRUYmhU?=
 =?utf-8?B?M2ptcU1MZWZpdWluQy92UVI0a1ZjVE9xSElqMjhwYjB5NzN1SE1rWjhSckFi?=
 =?utf-8?B?ekp4cVl5YjFOSWxQUm9ISzhiZkcyS2UxTzU2ZVNIY0F3M0p0NHNUUndlcDQy?=
 =?utf-8?B?Z081c3NibWtaN1NucTlFNlA1aEllNWR1ME9XWUJNZC9taE45SGxFcFMybmd5?=
 =?utf-8?B?em5FSURoWVRtSmRrb2I4a2xMMXJxMThnQmE3Q2RlMWd6WGFGV3N0T3Z1T2Jj?=
 =?utf-8?B?MG5KeGdaRkZKZUlTbjZ3cUFsYjVMbnkrY0MwYUpqV0V0VkxSZUduY1dqWFlX?=
 =?utf-8?B?SnNBSDZiN0FyOG1ldzhTUHVqVXhuZWYrdjd6ay9KcGVSazNwSHk5cXhHZmx5?=
 =?utf-8?B?L256YWphUkZhNHgwTjJHZlhRdkJQekxtcEptdlB1bWx4L0hRdHpXZS9vVkJ5?=
 =?utf-8?B?eHRmVkZiamc5OG9Nd1Q2VUo1N3IwVm5EU28xMktNL2dnbERUTnJQQXpRNFhV?=
 =?utf-8?B?d1ZYYzFmODQ3MDRvOTZ0czc5QzZ1cWNrNmxLek9GRTJWd3k1U1VEUW55aHJw?=
 =?utf-8?B?RjEzdEJyWjNLYjRRNDNXQU9kNzVYRnUvdDAxT3JYQll3eTNlRnc0ODMwOCs5?=
 =?utf-8?B?bURaSDZiS29ySUtVbXF3WXEvOHpEdVE5NGhDRVZnR2VMbHdNSzFyVXFDMldn?=
 =?utf-8?B?YzVxV3VaNUthNjRiVXdSNDBQRjJPTWxwaWM5Tm83TU1hL3Z6NUwzRXdyRW1t?=
 =?utf-8?B?WENuLytLUVhoeE8rNmhoNEorMjBoSTlucFUyQ1VDa29zM2JmcGlGanRnNG1p?=
 =?utf-8?B?alQvYmtBTXNEcVRkbHpYb2Z4Mk5nYVNRT2hTLzJieGV1R21pTmxKaUpPY1Vi?=
 =?utf-8?B?UXEyemNRa1ZXMWhDNUhJRXU1SWQ4bzhuQjVRVmY4SW9NajJ4R2pPdmxIMUNu?=
 =?utf-8?B?S1JIejZMeTZVWGJCTGw4UXdZaTV1Uks5OG8vM3NCbktwUUNYZnRRdEp3dmZy?=
 =?utf-8?B?ekhDa3NSOXdyaE9lTzl3K2RnbERUNGs0TitkQ0poUHA2OVVwcEdnR3RLc3FO?=
 =?utf-8?B?czdES1p6ZjVXbG5MLzlMa0hNMkRocHVLaTV1MWVSNkx0Zy9xQlBoblNuRWZX?=
 =?utf-8?B?cXBQcC9xTnJ5Nm1vWnZZN0JEYmxnZXZKd1RxbWUyM1hoSmROZlFMNkgwQkQz?=
 =?utf-8?B?M1k4Z3RFUnlPU2tuV3o5cElHRGJuY0t6TUZLTVlrcW1ldkF0eko4U3hsbkdS?=
 =?utf-8?B?RWo4TjNFYkxlTHE0NmFqZFY4Ynk5MEdKNjA4TUJZUzNjN2R1T0JqbzM5TDh2?=
 =?utf-8?B?bEN6a2VTQlowdW9KMnNyczBEMitKYlF1ZFhyZFBkdzRWOG44Q0E5YmdQbVV5?=
 =?utf-8?B?VFExcGlWMjNTVWdka2RQOVU5bjdJTllIclRKZzVOdnM4SWRiU3U3Ykt4WTdP?=
 =?utf-8?B?WnFVQTRGQWYydWFCTGtsZVRnYmpBSXFIejZJRTVYMVg5YWpoZkJVcFNWNlo4?=
 =?utf-8?Q?0B2MaLjdLCnfvnAW8kqYZsIURnEdsNgRuJDFmAow/PuI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c3poMXFvSTluQkg2RlMrajh1Zkl0S0NlN1JRNmE1TWtGSjRjTmp0OGhrSTFo?=
 =?utf-8?B?VzNoZ2ZBY3BVdUFvbUVhdVUyK0ZEVTZUclBvbUJYZUdtVzE2ZXZpZFJPT3ZW?=
 =?utf-8?B?RUF2a2RPbDcwdGt2M0JVRyt5OG5vOGFrcTlwY1RvVlFaSHZiODc5VkxFVFpM?=
 =?utf-8?B?Q1E2QUV2S1BDTnBCU0JISmp0NEtjc0pEUkVOYllZNXl3NlNOTjg5REpTcFFj?=
 =?utf-8?B?dHFGcExvSGxzemRSYlpEaXpJSVdwTitVc1U2MEpoWm5JVGY3cjZZMGJBNlIy?=
 =?utf-8?B?b0FZbC9yd3VYN3FKbkptb1dxZmVScGpOTUFnaGFjOUY0ZUdKeHBrZlNxSWVI?=
 =?utf-8?B?VS80czRHcHJqVmdpTXJFb1Z3WkxQeHBMdFJiU1YwMHRDZEVGUklVbHRWQy9t?=
 =?utf-8?B?SjJLa0Q3T0VJTVduMXNob0JjUkEwKzE3OG1PTHBDRnROOWhjczVkMG92MUlN?=
 =?utf-8?B?T2pwaVNCbEs5NG9RMkhnbEt2eXBtSVhObjFyTGI0bmRaa1VPbzA5ZGZyVGZ1?=
 =?utf-8?B?MFp6S2kvMTVhUEhERHhLdFhtZnMvZVU2cXN2eWJaZXZaVElvOHVIRERDUk42?=
 =?utf-8?B?aWxuQlptSm03UVFyQmdDRVNaVFExUG9BbzhUenpnOW9vQnpoRzFqVDZwaVMw?=
 =?utf-8?B?bThYcmtmMUNvY2lEZzd5Q1k4a2JIR3lOakpVbzJNOGJSMXNLenRlVkpsV2ha?=
 =?utf-8?B?WDZpM1NScDJiYkMwMEJSNDZ1RVFGNGJNMjZjb2lNOVBvWEMySTI1a1lvS3Fu?=
 =?utf-8?B?YmhmRDI4UTQyUC91NFh1ZmFnN3NmcC9MdXNWKzVtcWdjNWppaEtSYXNKWGdh?=
 =?utf-8?B?NTJOdmFUVjU5SWhWN2hUak4ySElReUJNT2Z1TlFIQ2duRXhQcjZKU1ErTkRr?=
 =?utf-8?B?eTRMV1YzMWVRa3o1aUZnd3c4YlFRWmp2emRjMENxbG9NK2U1cC9FU0g4Zk12?=
 =?utf-8?B?K0Jlc0NFVGxnM3NieWlqSC96NE1HOG10QzViaTh2T2s1ZFhwcUo1RUlNVDlL?=
 =?utf-8?B?SkJNekNLd3c2WTU1bllpVUQzT1JCWWZTeEl3WFB2OHN3cC9IR0RKZlRsSzZh?=
 =?utf-8?B?Q2RkQmd5TlNkNGtOSWovbkxoQ2JkZWRIWWVVNTZhay8zTXV1bmFnTFZmQjdz?=
 =?utf-8?B?QjhjMlMvYlg0VnRudXNMQ2syak9zQzFNeHRSUjIvaG80TkQvMzh0Um9pKyt1?=
 =?utf-8?B?MlV0TlJuZTZiL09WYnJybEdENUhqZWJxNHJGWjdKQ1dhaGZJL3hoV3lweTQv?=
 =?utf-8?B?R2tBajVwVXVEOGQrOTJrb3R3WVBJaW1kSTdLdjZoc3BkRzNZSFN0SEJFMFMr?=
 =?utf-8?B?REczR3h4WGJhOWVJTkNSZUEzZGQzWVRDNWt6TkFaaFRKRjRqZkdvbVJndG9R?=
 =?utf-8?B?OTE1bkxJaXVDWU85djNCa0JtN0tFVkNYT1F1aUhXSU9KYnpIZk5TVXJvZHdn?=
 =?utf-8?B?MTcwcU44YkxqT0FNZTVFdlFxSVYwc3hWV0dLb0RXZGY0MllyaDkvSC9pY3Nu?=
 =?utf-8?B?VG1tZlUzZ0xYNnFDcnlpdkxuYzhUWWJlZ1l4VW9YZ05vTkRsYk5RM1luSlo0?=
 =?utf-8?B?bFpidnMrZzcvRmx4TUFLSksvZHFvRGZHN2JTL1pjSXBpbVB3OGdyTldkdmUz?=
 =?utf-8?B?QUphNzV0YU5rMTVMam5NWmRVZ3JESU5jZkxhUzNVdVJwdDV3MGVmcmNtMUNZ?=
 =?utf-8?B?WUlpYytrMnA0Qm5HQ0dJK09FNlpmRmpydE9NVlBHNXZ6Rk9Wb0M1WFhlSXBN?=
 =?utf-8?B?L3duWnh4SWRrQ2lZaHZDaVVuYXZIcU1lQ0daelJzMTJ1RVVBYzZ6NXA4SmJr?=
 =?utf-8?B?cGtkVmRodnFKajkzZ2tNMFliN2Y0T0xnalAyNjcrSHB0clJEbWNickYvN0kr?=
 =?utf-8?B?WG94emx2dnRITEUxV3ZBNXJFTmJnSWNBa1lRaW9LZHdyaHlXRWxyMFZlOU5h?=
 =?utf-8?B?bWlvaWVKNEVQem5IeWx6WklWR1BYT3Z6amYrM1JDUlRqaldFRzZpWUJISXRP?=
 =?utf-8?B?RmtURmo1ZnkyZFgxZkZzNDJWd1NPbzRPMEw5em5HblRTUmtSOUpkejVHSnpu?=
 =?utf-8?B?WHFTRzNLY2dqREp6RXJvZ3VKaEl4ODVJOUwvYUJNV0VTb1hPSEU1TFFrQjdr?=
 =?utf-8?B?cnlVYUlraWdaTXFnZ0c1M21xVkNGaHFsbHBiUjFMckpFY3g4K0hOTEQ0Y2VY?=
 =?utf-8?B?cXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fcec74a4-8056-4af5-d34d-08dc75ca6f87
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2024 17:05:49.7122 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K+40r3sIy92wLewLz14BUVRXPOPHwPbbKw/k2S1G9kXQ3RytQAFfjahxaI/XTfLWKL092biuVH2c6zjPemMvJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7374
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

Quoting Kamil Konieczny (2024-05-16 13:30:47-03:00)
>Hi Gustavo,
>On 2024-05-16 at 09:19:26 -0300, Gustavo Sousa wrote:
>> Quoting Kamil Konieczny (2024-05-16 07:40:58-03:00)
>> >Hi Gustavo,
>> >On 2024-05-15 at 14:35:55 -0300, Gustavo Sousa wrote:
>> >> Quoting Kamil Konieczny (2024-05-15 14:10:55-03:00)
>> >> >Hi Gustavo,
>> >> >On 2024-05-09 at 12:24:29 -0300, Gustavo Sousa wrote:
>> >> >> For development purposes, sometimes it is useful to have a way of
>> >> >> running custom scripts at certain points of test executions. A
>> >> >> real-world example I bumped into recently is to collect informatio=
n from
>> >> >> sysfs before and after running each entry of a testlist.
>> >> >>=20
>> >> >> While it is possible for the user to handcraft a script that calls=
 each
>> >> >> test with the correct actions before and after execution, we can p=
rovide
>> >> >> a better experience by adding built-in support for running hooks d=
uring
>> >> >> test execution.
>> >> >>=20
>> >> >> That would be even better when adding the same kind of support for
>> >> >> igt_runner (which is done in an upcoming change), since the user c=
an
>> >> >> also nicely resume with igt_resume with the hook already setup in =
case a
>> >> >> crash happens during execution of the test list.
>> >> >>=20
>> >> >> As such provide implement support for hooks, integrate it into
>> >> >> igt_core and expose the functionality via --hook CLI option on tes=
t
>> >> >> executables.
>> >> >
>> >> >Hmm, why not just a pre-hook@ and post-hook@ in testlist itself?
>> >> >It will be easier to handle - just more parsing.
>> >>=20
>> >> How would that work with respect to filters? The current proposal all=
ows
>> >> something filtering the events to be tracked. For example, one can us=
e
>> >> `--hook "pre-test,pre-dyn-subtest:echo hello"` to run the command onl=
y
>> >> before test binary starts and before each dynamic subtest.
>> >>=20
>> >> Also, there are cases where a testlist is not really used. Examples a=
re
>> >> calling a test binary directly or calling igt_runner without
>> >> --test-list. So, while I believe we could consider support for
>> >> describing hooks in testlist, I do not think that would be a substitu=
te
>> >> for the --hook option.
>> >>=20
>> >> On a personal note, my current use case for hooks is more towards
>> >> debugging, so for me it is more convenient to have a --hook option th=
an
>> >> having to make a copy of a testlist only to add the hook instructions
>> >> there.
>> >>=20
>> >> --
>> >> Gustavo Sousa
>> >>=20
>> >> >
>> >> >Added Petri to cc.
>> >> >
>> >> >Regards,
>> >> >Kamil
>> >> >
>> >
>> >Ok, that makes sense, I will look into your patches later (maybe next w=
eek).
>>=20
>> Thanks!
>>=20
>> >In meantime please look into GitLab failure here:
>> >https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/58540606
>>=20
>> Yeah, already tried to take a look at it a few days ago [1], but as I
>> mentioned there, I'm not sure how I can get more info (e.g. logs) on the=
 CI
>> failure. The test works fine for me locally. I wonder if it is possible
>> to setup the container locally so that I get the same test envionment.
>>=20
>> [1] https://lore.kernel.org/all/171527425512.5772.1654105508452706087@gj=
sousa-mobl2/
>>=20
>> --
>> Gustavo Sousa
>>=20
>
>Command used is in line 29:
>meson test -C build --num-processes ${FDO_CI_CONCURRENT:-4}
>
>and fail is:
>13/30 lib igt_hook_integration FAIL 0.72 s (killed by signal 11 SIGSEGV)
>
>I tested this locally after building (so binaries are already there)
>using 'meson test -C build' and it fails:
>killed by signal 7 SIGBUS

I'm getting success result on my side:

   $ sudo meson test -C build
   (...extra lines omitted...)
    11/424 lib igt_hook_integration  OK  0.22s
   (...extra lines omitted...)
   Ok:                 420
   Expected Fail:      4
   Fail:               0
   Unexpected Pass:    0
   Skipped:            0
   Timeout:            0

So I wonder if there are environment differences causing the test to
succeed on my side and fail in other places. Is it possible to get the
image of the container used to run the tests in CI?

--
Gustavo Sousa

>
>Regards,
>Kamil
>
>> >
>> >Regards,
>> >Kamil
>> >
