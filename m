Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2A20D64060
	for <igt-dev@archiver.kernel.org>; Fri,  8 Nov 2024 16:24:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53B3E10EA05;
	Fri,  8 Nov 2024 16:24:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qc3Xrsbu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91B0A10EA05
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Nov 2024 16:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731083058; x=1762619058;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=VfWhylRVLiwgwCP0cs/wq9aKb7mSlv7ajDveipODWwk=;
 b=Qc3Xrsbu2T0cWhx2K9JgXruz6PisCN3ogTb6VZ1Qm765mj8k/Tkk3fLR
 Uviv1BHa3lrZjxMTzc4BbuPSZxubFMb5s3e4ysXNaMFJJdLvrVWsqoqIU
 A7naopAQ2sJQdriavgYK0q7kS9yFkNQDGjzJTIIJzZDkghA4d4Yc/8oTG
 eduQT1mMhEVPTeAIcFsbn+N+zhb6iya3oNUDUCR+th5/+gySgFSh42laC
 T26zD7ZmNBFEYl78Tu34+EnQ4QIRbH2LNMhxj0LGlMW3AU1jiY4UrioJ1
 /hHnCqtCWiJYk3xdMD9A0yW6KCNDvodx4trpS8TyumnCjHTU+nobnGuUx w==;
X-CSE-ConnectionGUID: 7KQs68rQQYmIvaAQmWO1nw==
X-CSE-MsgGUID: XgB0w7kYSA6ax4MtM3c76A==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="34661929"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="34661929"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2024 08:24:17 -0800
X-CSE-ConnectionGUID: ppsj9cR7SJmScUVj7grE2w==
X-CSE-MsgGUID: dDo2/oR7TKC3zLliUWVDMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,138,1728975600"; d="scan'208";a="108923544"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Nov 2024 08:24:16 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 8 Nov 2024 08:24:16 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 8 Nov 2024 08:24:16 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 8 Nov 2024 08:24:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uxa5cxkrDQKbvI4qo/SgATizDzty5zmepOy+VAVnqtQbeoSkNzEXuzGswuPt8ymXMKOYJPiNJvzF59GERP7V7z6pBlfJ4EvRzfkV0DXkMZhRJ+m6Omr4ogmqPqyK6wYHglWNm/KyrSVOxHOUwWsDiZbqIn4jO7D1Pew1zaDdU/9K+TjozzgypnkSM/YyZXUMa20Iflwblaq/ybcGIFOObMZ79EqkTwSW179YZjjYk5SzxdByH6GPBDIYR7j7UJsatU3Nhpxyv8wJs8Bxbni1X1/LLKr1GTp7InTwEybAPW9OwAEprI2+k5IxQ35exF5H0AJetc+KG2U9/E+cc3cYTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uUm6R99lIcqFNIeWXjRLuNtpIvE7RKgykq06gDbhRRM=;
 b=RPbi8DgQq0dO/b7t//mNppbkUXPSDf9XdJ+fRTOp7C3SQl/8A6Z88/NQBQiay/ebepWtXA9H873uvAgeOt672/mAJq4lB5iriV+Y6q8BsRscAZruCcbeRaRWDlIb8W2POpXRhTZy1EFSq8O9KuSF+ZzOmMFIma0XUxzGOFWG/arxi+/XLJRANTiB7rcz4wyL0X/WuBf9UVGikrHES6+knEzvAxIw4LKNHplS6FgUbPRP6/iU4d7zOW9vSeAV8Dh/vxqRgWIK62zkMi0nK8EKUrYrzvHE2He/cv32lM3TLJRxBiSGcBpG8IDyZUkck595GjAHKgi41Ir1OgAt2q4/cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MW4PR11MB6691.namprd11.prod.outlook.com (2603:10b6:303:20f::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19; Fri, 8 Nov
 2024 16:24:09 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8137.018; Fri, 8 Nov 2024
 16:24:08 +0000
Date: Fri, 8 Nov 2024 10:24:05 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Peter Senna Tschudin <peter.senna@linux.intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Gustavo
 Sousa" <gustavo.sousa@intel.com>, Zbigniew =?utf-8?Q?Kempczy=C5=84ski?=
 <zbigniew.kempczynski@intel.com>, <ryszard.knop@intel.com>
Subject: Re: [PATCH i-g-t] igt-runner fact checking
Message-ID: <pyw64raj3xn5mnrvfj5vcy6vpfatqohmp4wz6ysrag6kqahsvc@gs6o5t3m3aff>
References: <136a49f8-8173-47a8-ac5d-e62e972e1005@linux.intel.com>
 <tmbhd2nam5xibqejlcpqo53zeiv543jkfokfh4yly63yjhpqf7@ruf6limclqyh>
 <8029d6ce-2d38-40a6-a574-00b6607805d8@linux.intel.com>
 <qkr5xhm23dbziwp53m2xwjciqeghfe4zdtlurnpgphyxplx5pk@dkwxqwdymu77>
 <5a7f1522-b060-4721-a3b8-bdda40e3a7d9@linux.intel.com>
 <2znykwayxm74wqltmbbas45r6zhyllxcmr5g4jywcfuw5atzvu@46cr4rouvdil>
 <51565249-4fd9-4e7c-a7fc-321ff9e40859@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <51565249-4fd9-4e7c-a7fc-321ff9e40859@linux.intel.com>
X-ClientProxiedBy: MW4PR04CA0173.namprd04.prod.outlook.com
 (2603:10b6:303:85::28) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MW4PR11MB6691:EE_
X-MS-Office365-Filtering-Correlation-Id: e4fca29b-5ca5-4782-bc7e-08dd0011c59b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?XdrlpMHRZjVIOQEl7zsWOs+YSlNdI7X9I7Mgd8vKtPMF7afPJKccjYEJxf?=
 =?iso-8859-1?Q?lNx3299wAh9CapR+zS9S4SK8//S/tXkTwartzA/SxIzF7LFtwYptYszmbX?=
 =?iso-8859-1?Q?OWsp7+Ken7T9ripH4+gVqvkgAYOhS255zMai5PXWxy40zoF2/PrQfGnTyE?=
 =?iso-8859-1?Q?300E4o6ASaBUfeFwU0F5GM5V+GE4OsRJJpqtvsBoWsLfLTBGvfZ+vCXkwe?=
 =?iso-8859-1?Q?JYQHB+qOjzsnCVoe3Q1/vmZlMQ9BluhwFl+zg2y6UwSokfW6EBx7gPEICR?=
 =?iso-8859-1?Q?50mTPklCSDsULAiDc9kW3U47yieCPpGArwBMvyaZ+OPK0e+HaTtg2NQgw9?=
 =?iso-8859-1?Q?Xsn1GJ4vPDGKHVOyT2IY8uaCmX/DkLnjfh6tWqe8L1robYEu5ANQucwxTn?=
 =?iso-8859-1?Q?/QBvaivGlXPAI2IOODSlpdn/IEuOYFhtEloPdgHk36a6sjBgr481sw3dXp?=
 =?iso-8859-1?Q?wwN1m3Bq3Wp+JTvDN12aWKvh+T0SGkzUTA7ikrSU0R4FVuuWV4u/kGKM4V?=
 =?iso-8859-1?Q?9vwosvSTIkmo+cZShkJ9bFbaGcdaFdlNttN4UEkZ/oqdRwtNK8Wap85xZ6?=
 =?iso-8859-1?Q?CItNwUbXGrNCF678xc+ndT42oEAaTSSxB0tvFjSEi+/vi0+yWhBXNYnwYB?=
 =?iso-8859-1?Q?yTN1qxhbwFy3T+ziQtreSLb50VWIDajz9aL6uALM1YWGUUZqjHoNTgr6DN?=
 =?iso-8859-1?Q?eW3mxGclZiRomS042bViWrAdJ+gBCFOjpMj9vyerlL/T8j66/3RcQNlrxJ?=
 =?iso-8859-1?Q?wpcFR/k4BKT8yPmw03jhW8K2jb4V2LQ5WCQID0AT3tKA//DA8W+9KI3ahm?=
 =?iso-8859-1?Q?x857sTLcRV5YfN86wFfdueP9NZP2SOpz5GqiCznhuzQSmRo+FdGsKUqj/s?=
 =?iso-8859-1?Q?760wa0r9pl8di4LmR8MvU8CNYOaQZFJnfZm8uJ5Iy0W9WwtzpCzQD4RNmg?=
 =?iso-8859-1?Q?hbgOPAkOJ4oMCSDAbj8mLSIi5J9QlO6MnmLmKsRXiK+OXyxKuP2cbkg8oA?=
 =?iso-8859-1?Q?RNu5Ph6HIvRRrUUAd6RFb8fP38hWwQzeYobU6aIuD+Bn6osv9UryKUU4/e?=
 =?iso-8859-1?Q?MZQ51dMdXfdsfcfUiM88F/s11nEDq7Vw1wy+c1873xQcea5zP78d0sS82J?=
 =?iso-8859-1?Q?p35A0lvDyTy++8zuk7/On3XTBlqzYemfIm5RP6EuCeFvM5d7TjFteTaYro?=
 =?iso-8859-1?Q?KTdazHlGD/9XJWy00dYOiwyoEu9LmND6jX5RXoUxBkVsnerljBhaZ+xSuw?=
 =?iso-8859-1?Q?GfPNvlUXJofjaZer8j55nt57Pvl8I8aM7TSyehwp6zS1s57aWsC/HbI4oL?=
 =?iso-8859-1?Q?aw9+et+WEYIapmTAcQjmGtVVPbHU4HcoA2r5JjHjVEKrgZiAgOymJC3Clr?=
 =?iso-8859-1?Q?Gb6JhqU5Ty?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?lMo3M2ouzMLhZp6sj4Rn3Q7QU+X9Um+iS9Hp52eJgbD79acdpsb3gZavOa?=
 =?iso-8859-1?Q?0DLYTPr4w+JJ/0DIZfUXVM2qRJ6nzG+UiHIeO8tDwlXVsiaUCq6hGoAq4s?=
 =?iso-8859-1?Q?pDRykr2zyU0GyZjx24fkdESC/rtvOF3XwUsSspi23uevFTOdSIdmgwRdPR?=
 =?iso-8859-1?Q?iKr1ZCXSBNnZXCSQz/Gabact2irgThgYw3jOv/thRbdJOWOWsU0kykkI+A?=
 =?iso-8859-1?Q?zzrlKbHv2BujwR4fLXa9DGJTJqU1nfjJY6RYiA8jfvnY8PpBucyZvW+Oh6?=
 =?iso-8859-1?Q?YgOv+xJv8TbOAi+/mTqXRYIbt3FNko5MLed3WiDvQz4O+pSb4p6fdb0DN+?=
 =?iso-8859-1?Q?X2DNXZoN2uRtqJPhvsE9OhRUOP7iTsbn+nr956u2rrym3kqjBu851d6gsG?=
 =?iso-8859-1?Q?vcqO8d+yElLtjjPDbFNKvuYRB3w63RtVazvaM4rqc62jHL4FS7w/SylN2Z?=
 =?iso-8859-1?Q?v3sG1HQJBAVD+sHZwsLeZGRHwhjyvy2Zb9Tm4J8diqY/rQAyrXZpBCNA0q?=
 =?iso-8859-1?Q?20d2w7jGQloRa54f5YeidLwKSvJjsma8UjFg8UK1On0wEml5UC3HjzzwKn?=
 =?iso-8859-1?Q?KQMfIXZkgEmRPpOJ1mYs7+C3yucwxGz5H+omooQ07y3O6QFP+gq0OD6cMJ?=
 =?iso-8859-1?Q?IGkET0qDNl+8Y5jIcLLXO9kaD3TXmHxjAnuwzCll6hFdn73u6dkOzjdthf?=
 =?iso-8859-1?Q?VuEVgF/naDyuybmm6zdYJSv5oPyQoTSG6n98fDL0zaasfqBxJciYOSu3/J?=
 =?iso-8859-1?Q?Y6IgnWitBZnVSWfIt8ZBRNk+XwdOgpvHXcIcXLa8Uxelgl2YUAaeAwxqsi?=
 =?iso-8859-1?Q?HWWpCdk3uNClfgnR+tDpUqz/bidbJKk6UQ2lyQeQXZrpJmP/X6KRIrpDvw?=
 =?iso-8859-1?Q?Z12XwssrllZMoRv7rM2mA1xhZZNtI+jpVPNEfCGZnpNPFHAVkVrAxdVaK9?=
 =?iso-8859-1?Q?qgTAsf/oS/HySW3Bhvnwv5plNlwkfUorEirmTtLo9erXU9YL5C8x9S9Sg9?=
 =?iso-8859-1?Q?KOZqNg24Ustl2x0b5SfcwcbOopeBmCRTpsVySM4HVNh51UVlxQKXWmXb8a?=
 =?iso-8859-1?Q?C5lDicCSvZHrMJw5Jdp7LaGoOHE3TyenPU4ZqjYHWtTHK6XNAaxzYzkr2b?=
 =?iso-8859-1?Q?919p3Pmisb7JRZs5BChE8MM1SEYAlY0X7KPSJFyeKB3DD2M03quJyf3IXh?=
 =?iso-8859-1?Q?WIA5eMdr5njosVOwEfCisIGobfHJeV6BC5BtUTftlNrbJRecYhOMT01zs6?=
 =?iso-8859-1?Q?1Qawm7rjkd/+PZbqGgOGxHeIbCDJRy6W/OiYr7pC76eFNqOA5NohtveDWA?=
 =?iso-8859-1?Q?2yfmLsAA5cXSNAOm1P71X+PB14cILQu+3zvHYgCcRV3YVt1xxaT3iLYw6b?=
 =?iso-8859-1?Q?q/+hzmooXhAtHbco44/aDev160hpHM79gEyS38bvlDEHVyFMbMxBN8Z7Ut?=
 =?iso-8859-1?Q?GCheF6lYZR7pJgkvtg0UpklJ/cgAcV+nXXtj0nFec49cHxsYZ/mDCYGPCT?=
 =?iso-8859-1?Q?KzFnFTGjm4QZv37ROpqi1C+Z5IWNxeogt0FlZPx1WT10DZZAMAi14AS5SQ?=
 =?iso-8859-1?Q?mdrHB7pHTEl2bCnjE1pJ6bdK9HFmZO4TR3zDqfe2a99C6d5ypPNyx5ZzcH?=
 =?iso-8859-1?Q?CUu3D9/5nYlBDLIoMyQyt5qtz9lBW4EAS1s6+1gNa2LDflB2dfmuWw+g?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e4fca29b-5ca5-4782-bc7e-08dd0011c59b
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2024 16:24:08.8614 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tpwMxqiFsQSOawiTljZJFmO/200S2GzvkmkW5s4vwK86EUaA0Suw5cz9nvvOFCFu2a3DgvYklQjdFtlDAGEOe9dPyqwJxaO7jORxUf25/kY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6691
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

On Fri, Nov 08, 2024 at 06:30:59AM +0100, Peter Senna Tschudin wrote:
>Hi Lucas,
>
>Thank you for your detailed message, and sorry for my broken word wrap in the
>previous messages.
>
>On 07.11.2024 20:29, Lucas De Marchi wrote:
>> On Thu, Nov 07, 2024 at 06:48:39PM +0100, Peter Senna Tschudin wrote:
>>> Hi Lucas,
>>>
>>> Thank you for your reply.
>>>
>>> On 07.11.2024 16:55, Lucas De Marchi wrote:
>>>> +Ryszard to know if the CI part would be doable.
>>>>
>>>> On Thu, Nov 07, 2024 at 08:18:52AM +0100, Peter Senna Tschudin wrote:
>>>>>>> +    scan_kernel_loaded_kmods(list, last_test);
>>>>>>
>>>>>>
>>>>>> So... igt_facts() hardcodes what is the info collected. Maybe we
>>>>>> should rather plug this into the hooks framework as part of
>>>>>> "built-in hooks".
>>>>>
>>>>> I do not follow what you are trying to communicate here. Also, please see
>>>>> what Zbigniew said here*. Facts are not test requirements, but the line is
>>>>> blurry. In the context here a fact is something in the environment that can
>>>>> change but that should not. An example is the disappearing GPU.
>>>>
>>>> $ ./build/runner/igt_runner --help | grep -A1 hook
>>>>   --hook HOOK_STR
>>>>                         Forward HOOK_STR to the --hook option of each test.
>>>>   --help-hook
>>>>                         Show detailed usage information for --hook.
>>>>
>>>> So... today we already have "generic support" for running arbitrary
>>>> things before/after each test/subtest/dynamic-subtest.
>>>>
>>>>     $ cat << EOF > testlist.txt
>>>>     igt@xe_exec_basic@once-basic
>>>>     EOF
>>>>     $ chmod +x lspci.sh
>>>>     $ sudo ./build/runner/igt_runner \
>>>>         --hook 'post-subtest:lspci -vv -d 8086:*:03xx' \
>>>>         --test-list testlist.txt build/tests/ results/
>>>>     $ head -n4 results/0/out.txt
>>>>     03:00.0 VGA compatible controller: Intel Corporation DG2 [Arc A580] (rev
>>>> 08) (prog-if 00 [VGA controller])
>>>>         Subsystem: Intel Corporation Device 1425
>>>>         Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
>>>> Stepping- SERR- FastB2B- DisINTx-
>>>>         Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
>>>> <TAbort- <MAbort- >SERR- <PERR- INTx-
>>>>
>>>> So, instead of creating a separate thing called "igt_facts", what I'm
>>>> proposing is that we build this on top of the hooks and these "facts"
>>>> are simply built-in hooks that are commonly used. We may even keep them
>>>> as scripts rather than translate to C.
>>>
>>> I fail to understand why one would want to do that. It feels hackish and
>>> misses the point. I would support your suggestion if we were talking about a
>>> temporary debug tool.
>>>
>>> The igt-facts are not meant to be temporary, I dislike the overhead, and I
>>> dislike the hackish nature of this mechanism. Can you tell me what are the
>>> benefits of using these hooks? This is an honest question, I do not understand.
>>
>> Having it in C would be completely fine too if with that it feels less
>> hackish to you. Key thing here is how it's integrated in igt_runner and
>> tests. We already have a generic infra for that, yet we are trying to add
>> another one.
>
>
>In one hand having it in C can an improvement depending on how the hook calls
>the c function. On the other is worse as it will require us shipping dead code
>that requires a magic command line option to activate.
>
>You have potential to make it faster, but you kill one of the value propositions
>from the hook infra: the ability to add a hook without requiring changes to the
>code.
>
>>
>>>
>>>>
>>>> What I'd like is something liked this (with whatever name we decide):
>>>>
>>>>     sudo ./build/runner/igt_runner --builtin-hooks lspci,drm-cards
>>>
>>> This is far from what I am proposing in purpose and in architecture.
>>>
>>>>
>>>> which is a shorthand or equivalent to:
>>>>
>>>>     sudo ./build/runner/igt_runner \
>>>>         --hook post-subtest:$PWD/scripts/built-in-hooks/lspci.sh \
>>>>         --hook post-subtest:$PWD/scripts/built-in-hooks/drm-cards.sh \
>>>>         --test-list testlist.txt build/tests/ results/
>>>
>>> For me this feels like a bad idea. It is probably an order of magnitude slower
>>> to run, and it is also granular in a way that I fail to understand. igt-facts
>>> should not be selected at runtime by the user because we do not know when the
>>> facts will change. Again, think of the disappearing GPU: it is a 1 in
>>> 1'000'000 kind of event, but is super valuable to know when it happens.
>>
>> So what? If we want it to run by default, we can:  CI just have to add
>> it as argument that is passed by default. See all the additional options
>> CI already passes. It's also not like 1 in 1'000'000 that's happening.
>> For the next bug we are chasing, it's likely not about a card disappearing
>> and rather about something else that we will have to add another hook/fact.
>> I don't like the idea of infinitely adding these things without a quick
>> way to enable/disable.
>>
>> If you dislike the additional fork+exec, this would have the same effect
>> of what you did:
>>
>> sudo ./build/runner/igt_runner \
>>     --hook post-subtest:builtin:scan_kernel_loaded_kmods \
>>     ...
>>
>> Again, I'm more concerned about the integration than if this is in C or
>> in python or in bash.
>
>Judging by your suggestion the hooks are not adequate for the igt-facts. My take
>from "all the additional options CI already passes" is that we should fix that
>instead of making this problem measurably worse.
>
>The facts are supposed to be always enabled, and they should always run on CI
>and on the developer machine. It is ok to add new functionality when the
>existing hook infrastructure is meant to something different.

Ok. I still think they are actually providing a similar value, but it
seems both you and Ryszard think otherwise.

>
>From the architectural perspective, current hook infrastructure is meant for:
> - quick, as in not requiring a patch, changes at run time
> - quick, as in just run this now please, tools or debug that are temporary
>
>igt-facts are neither of these things.
>
>So no, no hooks from the command line for igt-facts.
>
>As for "It's also not like 1 in 1'000'000 that's happening.", I meant it
>literally. Count how many subtests CI runs between each time CI detects a
>disappearing GPU and I expect the number to be very large. For the V3 of my
>patch I counted 20'942 subtests on "IGTPW_12057" alone which is only a fraction
>of all subtests ran for a single patch.

We need to look at where it's reproducing... 2 tests: the xe_module_load
and the hotunplug and particuarly on discrete). Providing a way to
enable additional things on narrowed-down scenarios allows us to focus
on the specific issue.

Anyway, it seems you both think there's value in keeping this separate
and always enabled, so I will not insist.

Lucas De Marchi

>
>Peter
>
>[...]
>
>
