Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07C13D4A5EB
	for <igt-dev@archiver.kernel.org>; Mon, 19 Jan 2026 05:06:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 926D710E357;
	Mon, 19 Jan 2026 05:06:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bB6pWiDZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DE9C10E261
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Jan 2026 05:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768799208; x=1800335208;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=6rP4bXGnar0dfYn7POVK8D3mX6pRr2h6ISOaPjX3cWA=;
 b=bB6pWiDZ0RlzST8GajEuty4GthGA2FcdxVsqPKtPcEDWRgpl74oGOVdj
 KttzsOtK71I5MyFiHeQlyLYD/FFHVV0yWSv552DsCuvHv+x+KggeAAKTT
 7+wb++EDMdizEVcsaJ7WxCpTDOkgrLMKMfkFIepm+1U4uY/4VLIm5aZ5g
 74RO/prpivXgsV9SFZGli59sTOpzsfTeMmjRStMAyAKjztjLY+FE/9QAx
 4y2yY+6h+fVak4QGbqoxpNpHAoE789B+/L+gCx7GyS0XGkH4Vut5i8vw+
 KhUH5zfS+8mhj/fWNlB0SUJSN1QmwJtUxvPD88ROCbvOA4Ct26EnB+RsN A==;
X-CSE-ConnectionGUID: 7vL5JottSzC0oXSZ4vAyfA==
X-CSE-MsgGUID: P2ZoetPaQyuDNlWquFO84g==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="80306641"
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; d="scan'208,217";a="80306641"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2026 21:06:47 -0800
X-CSE-ConnectionGUID: QAybMd7IQSucdhYOd65ECQ==
X-CSE-MsgGUID: rVIeqGsFTWWFI/2ZzeI2EQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; 
 d="scan'208,217";a="205672056"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2026 21:06:47 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 18 Jan 2026 21:06:45 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Sun, 18 Jan 2026 21:06:45 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.55) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 18 Jan 2026 21:06:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HBKcVEwQxzPs2PcTafx/MSt1JEAOmD15q6S0j7PNapbfJvOwXvAKeg2KHJ7WZCkPICwZjWXFN4rpQq+oJvXDZpKqFITIYO1wWveQfR79QmlZSeU7Nc6J4Cl3wXPp0yUHo9ehgT/H/g4UXQPzULazDHWv9qqaI9m5argLRegMKJVBVc46dfILxigBJcrkZ7sTezOx2QZ+x2ztG725VWDZ8o4vG1q2p/aAvmpthspOr/lIkSMk5hxNOkSND7fGEgVNOu+56de87UY05Qg7dCb9H4umXS9e4wg2jS+fL6ZMVOBYzGr/sMvmSWC8lDfvNIARhkoavHQrd9DE93m+7GeYhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EvVKbZKlKH3z2Y/RWH5P+CSUP/d9+akvrCeJEL1NV3c=;
 b=hrvH6HsZbElPFdAu2oZ8PLKvOMrVl79Jr8QMKUCFySWkXKztIVfd5xdyy176m2jUFqVFVWK28uXn6vk5V4MhcFrzTMSOih3hcevyBn6tZR4J1I1Y/Z82dwNoL6UQ1dpgEB3BV+HBRmVEs2mxq/3mJ3hvjfAocJvWFpFaj8Wj8wRWtYCIsl69LixtGAnngf1bHkc8SPd/birY2B0nXOL3F99az7fNLVm3+uiDFs6pJPyUCus7iEuYgt5K2lDgSQEZE1jBmun5J4hTKsg+EzaNRWthxON6N4Jm3hmfKGGt0AzSJYrYqkaV61b9/6sN7KUFqyMTr2ijmPwsrKavOuwSBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7151.namprd11.prod.outlook.com (2603:10b6:303:220::5)
 by MW4PR11MB6763.namprd11.prod.outlook.com (2603:10b6:303:20b::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.11; Mon, 19 Jan
 2026 05:06:41 +0000
Received: from MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::3e94:e15c:782b:bb92]) by MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::3e94:e15c:782b:bb92%6]) with mapi id 15.20.9520.011; Mon, 19 Jan 2026
 05:06:41 +0000
Content-Type: multipart/alternative;
 boundary="------------LR7QE6gVNeKiU0B3P7qMm3Tk"
Message-ID: <d4b4a604-02d6-42e6-910a-2b7c7792fec2@intel.com>
Date: Mon, 19 Jan 2026 10:36:35 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/1] tests/intel/xe_evict: overcommit tests for
 fault-mode and non-fault-mode VMs
To: Sobin Thomas <sobin.thomas@intel.com>, <igt-dev@lists.freedesktop.org>,
 "Hellstrom, Thomas" <thomas.hellstrom@intel.com>
References: <20260113070806.189718-1-sobin.thomas@intel.com>
 <20260113070806.189718-2-sobin.thomas@intel.com>
Content-Language: en-US
From: "Sharma, Nishit" <nishit.sharma@intel.com>
In-Reply-To: <20260113070806.189718-2-sobin.thomas@intel.com>
X-ClientProxiedBy: MA5P287CA0057.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d3::7) To MW4PR11MB7151.namprd11.prod.outlook.com
 (2603:10b6:303:220::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7151:EE_|MW4PR11MB6763:EE_
X-MS-Office365-Filtering-Correlation-Id: 36dc43ef-27b3-4405-a294-08de57188862
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cGFJT0t3M215Q3FJekZvbzgrcXV1OW4wcFllYVJqbjR6QjdpbTI4aGo4RkRO?=
 =?utf-8?B?Q2VhRjdsY1hyanNseVdBR3pTMjRzOFJnWDZ0azlZZU8rSjZrNTBjRExleitj?=
 =?utf-8?B?emJTSmQ1MlhvZHFsVmx6Ui9yOFBUUkNTbk5oNitvK3FtUGhjeUFwbDg3Mm9t?=
 =?utf-8?B?alQzUUVCd1BDWVM1NFNibi93aWs1eVhvTkFxRXFDWjdjT2ozWk9iZnRkVVJM?=
 =?utf-8?B?ejhlN1FiSlNKeGpKZ01aLzhRQ05BdVJCb1IzZkZ6MmtWdjNtUWpDdDNkR0px?=
 =?utf-8?B?akRKS240T3grY0lNaUQ3TzgxbWZTaFJUZ0pRUjYzV0hFMnBGWW5zYnRSZWla?=
 =?utf-8?B?TVdTV1YxRHB3WWVqckJnbWVjN0hmVWlFSm04eG14Y0JiY1BheXFsN0x4eE50?=
 =?utf-8?B?Z0RucExMSTBUMzJiKzhVZHJ5cExBNVo5YXEzNHZySzF5TTdYK2xGd3FhZHlB?=
 =?utf-8?B?eFR0R1NRc3RPbEZXbjJXalRidkY4NUtBSFhyNHEwdGN0L1A1LzJ3bHBodk1J?=
 =?utf-8?B?ME5rUWs2aXpxWUxacWZ1aldEdmI4K2V0OFNPZjdkRHF2V1VLazE1VnVBT0ZI?=
 =?utf-8?B?cFRYQmVqdnYrY25XV1poOUlEaDU1dnAzY0NxR3hVK3V4SlROKyt5TzgySDBz?=
 =?utf-8?B?ZkY2M1dTVHpScHlhNWNNRDRJUkFmOEF2SDQ1WGlzY0d0WklYTWNrcm9qRFlF?=
 =?utf-8?B?OWJabUo5Q0RqVXdYS1Z1SkErbXFqV2JZZ0U5bVI0bG9VUGJrTGU1WDErdnRX?=
 =?utf-8?B?OG10L0RBLzVzOEczRE9jODBkMENrWkRMYTlpYUg5cXFXZ0Z0UnJWa3BIVytk?=
 =?utf-8?B?SkVOSFZkZ2tzRjQvQWx2d1Vkc0xkczVLR0RHWjExZzRhQW5FSDNHbHlnMzVS?=
 =?utf-8?B?eWc5VWI2ajI4RkxWaDQyNEsyWnJkUVB1cE0xZ2tnSGc0SmpBazdCMDAxYzZl?=
 =?utf-8?B?QnpJMHJXcE1kUnc1TWRrNXJPTCtxRlJhcENFRktxMitrQ1hoa3YrY1BFeTEy?=
 =?utf-8?B?eC9Pb0xLZXJmanNXRDBsVnNOKzYwajl3cW4yRTFSWVZybVdPY1Jybm95aGtD?=
 =?utf-8?B?cndCc0I1dEwyREZiREpDK01uaGFsYjh1NnJ5NjFUQ2dVSzVIWVpkREtxTWhF?=
 =?utf-8?B?MVZPMVRuRUpsaFFReEg3NTVyZ2UrZFBrRlZsMmZWcFVESzBaMTF3TUtlL0lY?=
 =?utf-8?B?MTh5bTUraHhmR1dZTlZWMkt2b3RwYklzUUNCWThjam1Rb0lNRXVWbkFKYmQ2?=
 =?utf-8?B?YytkT0E5cWNsSUVUSzcvUnk1R0tLcEZHeVMrZ1dUb3ZRY3dlc2JwenFRMkhJ?=
 =?utf-8?B?THlpNlZUKzlRcDNpZXpzbUpLZnh0NEl3byt0NXdXbXRxeStnd2ZHQWxzcEU1?=
 =?utf-8?B?MGdaak51d2ljQUZKbWJ1cm1Dc1pKbFZ5d2tKOUQra1FBckRUT1VjMGJTVGxn?=
 =?utf-8?B?TTcvczUxb2hhSEVia1dwd0UyVyt5Qmw0c051Q0tlNVBKeGZQOWRyY1d2Y3Qw?=
 =?utf-8?B?K1JWWjgrZTNUQlNYd0hGMmZaN2tqMloyUXlQTkhOK2VtbUhiRnNrVDA4VDN4?=
 =?utf-8?B?WGhDREdyOTZ4c2FKYjlxMkYwVk5sOHhsY2hqYnJEaFNyK3RMUDlYTC9IYm0v?=
 =?utf-8?B?QnNDaytKN2pLVktTTGlsYWpqVCtaU3J4a1hCWWhKMFpCZ1lBOHpyZHBZeWZx?=
 =?utf-8?B?Rkw4eUJscjErbkFXeHFYVGV0eVRPZHdJWXMxNG1xQ0xiS0QrVUZYL2w4SndU?=
 =?utf-8?B?TXJMV2xnTFk2NGpsZkhVSzdjOGRucUV1L3QybUlzbWpPRXpKK2pzSjczVHhl?=
 =?utf-8?B?bDVKc0JoQnRiSU8rcEo4Wko1S2VUTit3LzhRdGxSdlNsdUV4WFB6T1JCYUtM?=
 =?utf-8?B?aHlhamVaVEtuL3lKWFgybmZ2NjBFU3FzSVovWXNaTTdaeDJLZFRITEErOFpG?=
 =?utf-8?B?UU9zVm1CTlhsQ3JlcHJZVzVZbU5lNytaNEs3aUZsenRyR25vWkRDZzNMbDd5?=
 =?utf-8?B?eGlnamdoZ09ZTFQ4d1ArMnU4UXV3eXBUSGMxd29tbnBzaWxiNnhkWlBibzlv?=
 =?utf-8?B?SEJmSUVHaDFRT2FPMXlNRUg1TnJJdk1CR0xtbkZLQTZvY3JxRm5UaXdOZk5Q?=
 =?utf-8?Q?A+0U=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7151.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SVVYN0RycVhKeDA5bWRnaXA1Tm9uZTgyM284Rm91bGNKZ2dNYURaYTM0MmF2?=
 =?utf-8?B?M1dLWnFvRmVMRzc4NkdnOGQzYWhzaEpIeHpQRzh2UVBCSkh5YU8rZHdNOExX?=
 =?utf-8?B?cUM0T2VGSXhZZ1U1TURheUZNQkRKTnR6OXdmTjFVdWR1enVhcmoweEZCcm9a?=
 =?utf-8?B?TTljdkZ2YnVjK28zQm1pUkoyeDdXNHUvcVpOMmRSejEvdHRpQnNrOHFPRll4?=
 =?utf-8?B?RWFGbGYzdjdDUEM3YWNiSjVQd1A2ZlhYNGE4SXJIQXBDN01XZTBTVUZ5ZXd1?=
 =?utf-8?B?Ynlrby9LMVYrak4yM0VrVWFYTUIydEloSHhmRm1yOE9Eemo3WWJSZ1RsSWpq?=
 =?utf-8?B?dGFaRXNNUkdxWXZnL2hhcnhSMHF1amtmUmRzRndpMmllQVFNaTN6NDZabCtU?=
 =?utf-8?B?Vkp5Q1h6WGhhejhDMWY2SlZEMzFOYnVyMFZLMExPaEdzd0tRQ2QzNTVnYzh5?=
 =?utf-8?B?dG9McjVwdEppSkV4KzBaaXhnMjA5a2RlQkNPbDN4UloxOWMxbEsxclJKWmc4?=
 =?utf-8?B?bEx3SFFZWXlZMmZibjF0Z1hiVkV4MDVZZStYVFY2dysvRjAxcktabkFRWmJi?=
 =?utf-8?B?MEdRb3dOZ3lEdlExWmZaQldhTmdtMGR5TUJ6ZVJ0NDJ6MXYvWnpSNVNRbFkx?=
 =?utf-8?B?Z3h1aHdVcE95TmpieGZvNngxNjZ0RlRKYnZsbWs4TEhhd3F6ZEJqcmY5UnMv?=
 =?utf-8?B?bmxPNGc1Q2ZVaGkzV2RhcnU4MzltdkZ1MDBTZmtMcVdxcGRmeVpjVzBndGlP?=
 =?utf-8?B?bUdqNWxYbVZPb0RoVG9GWkxtZjhaZXdUU0hRZGtDZGFMdnZkNUJ2UDlUa25G?=
 =?utf-8?B?OEN5RnZMOXoxMnBnWkNWbGRTTVZ6cXF3eXFJQ3d0cGVwNkxLY1QxTUtkbXpV?=
 =?utf-8?B?UWQ0bHRDRnBJL0hiZi9Pc013MnBYRTk0MUQ4U1FWMnlrTFlpUWhYWWRjWU5T?=
 =?utf-8?B?dHNtaDhoN1BWVU5LN2kvaXVOb0FwM0Z4QTZtUjVqRlNhQnVnbmtjM1NIeHI0?=
 =?utf-8?B?bU1NelIzdUdNNVhVWEM4QWNnR1VQUW8vanBKQ254YkI1Y3lTdE44aEtzbUNo?=
 =?utf-8?B?UFBaR1E2ajNIdTNrVGdyZWQwdnQ4blV1bk50cDFBVTcyZXIwRUVKZ1BaVFNF?=
 =?utf-8?B?WnNqaXN1NlROS0YvRUhJNUlMaktLOEZXbDNYcTBPZjhTREhpdDNGVWVGY2xC?=
 =?utf-8?B?c0F1bEpxYXJ6anROWGVFK2xIdkxrR085ZHpRNGppYzVDNE9teGlqY2FVekJh?=
 =?utf-8?B?T0VTVy9WYXhyN3FPWGdZVDJZdU41OTdQMXppVk1IYWlCZ0Y2UmRCcDNkMWRU?=
 =?utf-8?B?R01GZXZIOUZNSmZJcWNTWWxqVUwvMjJJT3gxZjZtaDNEeW93S29GQlFiWjZx?=
 =?utf-8?B?ODRYV2RjTGNBQWREOFhMU0hSU2pGTy93blErSzJ4YkNiT2E2blBkZTNiK1ND?=
 =?utf-8?B?SExRL2VadFE0U0FMRXkza1RYMWdreDc2Mkg4Rmw1QVg0dWVKNUlaeEcxTi9U?=
 =?utf-8?B?RFhwR05JdllTYUxKSDNNanF5VjVNM0lneFlCRE5QUkRXUXdVcWxUU2c4OEoz?=
 =?utf-8?B?aDB3VnNHb3pjR29uL0RnRDhlajRJeWl1V241SjRhTHRqTXpmVUx1UG1PWjJ1?=
 =?utf-8?B?aThCOER2UTNySThtR3Bnc0dXTGZJb1RzUnhwU3FuY0tmam5MZEtFaUR0Rk92?=
 =?utf-8?B?MUkxUE1CNm95bGZ0RGgxd1h3YjZzbXh4YzR0OHd6QlU2WjMzUm5aQTVUU0sw?=
 =?utf-8?B?ZERpYys5bUIxNnpxSVIxeWRrdUZTcUtRWnF3dlNiZncvMEtJTDdGSkVGOHBG?=
 =?utf-8?B?NStjK2oyVjN2OGZsMTFvZ1dnYUdwemx0RTZqQnJ1Skg2ekhqS1FWOU1jQk1G?=
 =?utf-8?B?cVM4clpsTEI1a0tGam4zR1dPMzBEUWVFRWNLdWFhb1poSUF2QndIZE1PR0R4?=
 =?utf-8?B?RjQrQ3pzV0hVYVlrZmE2Rk8yWHlNdVBKR0xPeDNzYk1pZEsyU3o3TWhOTVpR?=
 =?utf-8?B?cldOaFJYa290Yno0Ymg4bDN0aEJWamlYajl3MGNwNThZYkZ6ZFA4SUIrOUV2?=
 =?utf-8?B?TU5tcXE3WjVxb3FyQ0VQNHhYeEFkYTI5T1NhaWRPQmE3c2hWSjhTL0pOQlhJ?=
 =?utf-8?B?a04rdjl4ZE9DVnk0cWF3Q3FIcXNmcVo0TDd4NlBMZVBBYTU4WlRnZDE3L0N4?=
 =?utf-8?B?Z3J1LzlPSExwK0RHZHltejdiZWtZYzV2MWhQYmgxbUlqUmJrUElqd2daWG9n?=
 =?utf-8?B?UkdOTHFkalZhY2l6c0c3bklXZ0k1bHJmUnB1cWxxQlR4d1dPT3o4Q1B6aHdI?=
 =?utf-8?B?VFFsTzUzYnNHYkFCYTBpSXZ4bVRQb2xqOEFCUnNjblBibDNGVS9WZz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 36dc43ef-27b3-4405-a294-08de57188862
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7151.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2026 05:06:41.7518 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0t8YOkay/dFXETIy5S4CnPcXyxe6zE9bkwDuW3X1It5HkpjCMJ+XEgnsnjFHOBoY7T+L6LX1lPmAQad9lXO40w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6763
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

--------------LR7QE6gVNeKiU0B3P7qMm3Tk
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 1/13/2026 12:38 PM, Sobin Thomas wrote:
> The existing tests in xe_evict focuses on system-wide memory allocation
> across multiple processes. However, OOM error handling in different VM
> modes was not being tested, and the previous test_svm_overcommit() had
> a critical bug that prevented proper overcommit scenarios.
>
> Add three new tests to verify graceful OOM failure handling:
>
> - test_evict_oom(): Allocates BOs aggressively in a loop until
>    OOM occurs. Tests error handling in LR mode and expects
>    -ENOSPC or -ENOMEM.
>
> - test_vm_nonfault_mode_overcommit(): Verifies that non-fault mode VMs
>    properly reject overcommit attempts with -ENOSPC or -ENOMEM as
>    expected.
>
> - test_vm_fault_mode_overcommit(): Validates that fault-mode VMs can
>    handle memory pressure gracefully by touching pages to trigger page
>    faults.
>
> Signed-off-by: Sobin Thomas<sobin.thomas@intel.com>
> ---
>   tests/intel/xe_evict.c | 330 +++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 330 insertions(+)
>
> diff --git a/tests/intel/xe_evict.c b/tests/intel/xe_evict.c
> index 2350487c8..0f739ec7b 100644
> --- a/tests/intel/xe_evict.c
> +++ b/tests/intel/xe_evict.c
> @@ -210,6 +210,274 @@ test_evict(int fd, struct drm_xe_engine_class_instance *eci,
>   	drm_close_driver(fd);
>   }
>   
> +static int
> +test_evict_oom(int fd, struct drm_xe_engine_class_instance *eci,
> +	       int n_exec_queues, int n_execs, size_t bo_size, unsigned long flags)
> +{
> +	uint32_t vm;
> +	uint32_t bind_exec_queues[1] = { 0 };
> +	uint64_t addr = 0x100000000;
> +	uint64_t available_ram;
> +	uint64_t total_alloc_size;
> +	int bind_err = 0;
> +	uint32_t *bo;
> +	int i;
> +	const size_t min_map_size = 4096;  /* Add constant with proper type */
> +
> +#define USER_FENCE_VALUE    0xdeadbeefdeadbeefull
> +	struct drm_xe_sync sync[1] = {
> +		{ .type = DRM_XE_SYNC_TYPE_USER_FENCE, .flags = DRM_XE_SYNC_FLAG_SIGNAL,
> +		  .timeline_value = USER_FENCE_VALUE },
> +	};
> +
> +	/* Check if we have enough system memory to proceed */
> +	available_ram = igt_get_avail_ram_mb() << 20;
> +	/* Calculate total allocation size - now for full n_execs */
> +	total_alloc_size = (uint64_t)n_execs * bo_size;
> +
> +	if (available_ram < (total_alloc_size / 4)) {
> +		igt_info("Insufficient memory to run OOM test safely\n");
> +		return -ENOMEM;
> +	}
> +	if (total_alloc_size > available_ram) {
> +		int safe_n_execs = available_ram / bo_size;
> +
> +		safe_n_execs = ALIGN_DOWN(safe_n_execs, 4);
> +		if (safe_n_execs < 4) {
> +			igt_info("Not enough memory to run OOM test\n");
> +			return -ENOMEM;
> +		}
> +		igt_info("Reducing n_execs from %d to %d to fit in available memory\n",
> +			 n_execs, safe_n_execs);
> +		n_execs = safe_n_execs;
> +		total_alloc_size = (uint64_t)n_execs * bo_size;
> +	}
> +	igt_info("OOM test: n_execs=%d, bo_size=%llu MB, total_alloc=%llu MB, available=%llu MB\n",
> +		 n_execs, (unsigned long long)(bo_size >> 20),
> +		 (unsigned long long)(total_alloc_size >> 20),
> +		 (unsigned long long)(available_ram >> 20));
> +
> +	/* Allocate array for n_execs BOs */
> +	bo = calloc(n_execs, sizeof(*bo));
> +	igt_assert(bo);
> +
> +	fd = drm_reopen_driver(fd);
> +
> +	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
> +	bind_exec_queues[0] = xe_bind_exec_queue_create(fd, vm, 0);
> +
> +	igt_info("\n n_execs = %d, bo_size = %zu\n", n_execs, bo_size);
> +
> +	/* Try to allocate and bind more than available memory */
> +	for (i = 0; i < n_execs; i++) {
> +		uint32_t __bo;
> +		struct {
> +		uint64_t vm_sync;
> +		} *data;
> +		int create_ret;
> +		size_t map_size;  /* Use size_t for map size */
> +
> +		/* Use __xe_bo_create to handle allocation failures gracefully */
> +		create_ret = __xe_bo_create(fd, 0, bo_size, vram_memory(fd, eci->gt_id),
> +					    DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM,
> +					    NULL, &__bo);
> +		if (create_ret) {
> +			bind_err = -errno;
> +			igt_info("BO create failed at iteration %d with error %d (%s)\n",
> +				 i, -bind_err, strerror(-bind_err));
> +			break;
> +		}
> +
> +		bo[i] = __bo;
> +
> +		/* Calculate map size with same types */
> +		map_size = sizeof(*data) > min_map_size ? sizeof(*data) : min_map_size;
> +		data = xe_bo_map(fd, __bo, map_size);
> +		sync[0].addr = to_user_pointer(&data->vm_sync);
> +		bind_err = __xe_vm_bind(fd, vm, bind_exec_queues[0], __bo, 0, addr,
> +					bo_size, DRM_XE_VM_BIND_OP_MAP, 0, sync,
> +					1, 0, 0, 0);
> +		/* Attempt bind - should eventually fail with -ENOSPC or -ENOMEM */
> +		if (bind_err) {
> +			bind_err = -errno;
> +			igt_info("Bind failed at iteration %d with error %d (%s)\n",
> +				 i, -bind_err, strerror(-bind_err));
> +			munmap(data, map_size);
> +			gem_close(fd, __bo);
> +			bo[i] = 0;
> +			break;
> +		}
> +
> +		xe_wait_ufence(fd, &data->vm_sync, USER_FENCE_VALUE,
> +			       bind_exec_queues[0], 20 * NSEC_PER_SEC);
> +
> +		/* Unmap with the same size we used for mapping */
> +		munmap(data, map_size);
> +		addr += bo_size;
> +	}
> +
> +	/* Cleanup allocated BOs - iterate through all n_execs */
> +	for (int j = 0; j < n_execs; j++) {
> +		if (bo[j])
> +			gem_close(fd, bo[j]);
> +	}
> +
> +	xe_exec_queue_destroy(fd, bind_exec_queues[0]);
> +	xe_vm_destroy(fd, vm);
> +	drm_close_driver(fd);
> +	free(bo);
> +
> +	return bind_err;
> +}
> +
> +static unsigned int oom_working_set(uint64_t vram_size, uint64_t system_size,
> +				    uint64_t bo_size)
> +{
> +	uint64_t target_allocation;
> +	unsigned int set_size;
> +
> +	/*
> +	 * For VRAM eviction testing, we want to allocate MORE than VRAM size
> +	 * to force eviction to system memory. Target 150-200% of VRAM.
> +	 * The BOs are created with VRAM placement, so they'll initially go to VRAM
> +	 * and then get evicted to system when VRAM fills up.
> +	 */
> +	target_allocation = (vram_size * 150) / 100;  /* 150% of VRAM */
> +
> +	/* But ensure we don't exceed available system memory */
> +	if (target_allocation > (system_size * 80) / 100) {
> +		target_allocation = (system_size * 80) / 100;
> +		igt_info("Limited by system memory: reducing target from %llu MB to %llu MB\n",
> +			 (unsigned long long)((vram_size * 150 / 100) >> 20),
> +			 (unsigned long long)(target_allocation >> 20));
> +	}
> +
> +	set_size = target_allocation / bo_size;
> +
> +	igt_info("VRAM stress calculation: vram_size=%" PRIu64 " MB, system=%" PRIu64 " MB, "
> +		 "target_alloc=%" PRIu64 " MB (%.1f%% of VRAM), bo_size=%" PRIu64 " MB, set_size=%u\n",
> +		 (uint64_t)(vram_size >> 20), (uint64_t)(system_size >> 20),
> +		 (uint64_t)(target_allocation >> 20),
> +		 (double)(target_allocation * 100) / vram_size,
> +		 (uint64_t)(bo_size >> 20), set_size);
> +
> +	return ALIGN_DOWN(set_size, 4);
> +}
> +
> +static void
> +test_vm_nonfault_mode_overcommit(int fd, struct drm_xe_engine_class_instance *eci,
> +				 uint64_t vram_size, uint64_t overcommit_multiplier)
> +{
> +	uint32_t bo;
> +	uint64_t phys_mem;
> +	uint64_t overcommit_size;
> +	uint32_t vm;
> +	int ret, cret;
> +
> +	fd = drm_open_driver(DRIVER_XE);
fd already passed from calling function. So no need to call 
drm_open_driver() again
> +	phys_mem = (uint64_t)igt_get_total_ram_mb() << 20;
system_size defined in igt_fixture() which can be passed as argument in 
test_vm_nonfault_mode_overcommit() and can be used.
> +	igt_info("Total system memory = %llu MB\n", (unsigned long long)phys_mem);
> +	overcommit_size = ALIGN(phys_mem * 2, 4096);
> +	vm = xe_vm_create(fd, 0, 0);
> +	cret = __xe_bo_create(fd, vm, overcommit_size,
> +			      vram_memory(fd, eci->gt_id) | system_memory(fd),
> +			      0, NULL, &bo);
> +	if (cret) {
> +		igt_assert_f(errno == E2BIG || errno == ENOMEM || errno == ENOSPC,
> +			     "xe_bo_create failed with unexpected errno=%d (%s)\n",
> +			     errno, strerror(errno));
> +		igt_info("Non-fault overcommit: BO create failed as expected: %d (%s)\n",
> +			 errno, strerror(errno));
is it expected to get error code apart from E2BIG, ENOMEM and ENOSPC 
which is being printed in igt_info? If it's not then igt_info can be 
removed as error code printing and test halt done in igt_assert().
> +		xe_vm_destroy(fd, vm);
> +		drm_close_driver(fd);
> +		return;
> +	}
> +
> +	ret = __xe_vm_bind(fd, vm, 0, bo, 0, 0x100000000,
> +			   overcommit_size, DRM_XE_VM_BIND_OP_MAP, 0,
> +			   NULL, 0, 0, 0, 0);
We can use 6th argument which is offset as 0 so that it can take address 
to bind overcommit_size automatically
> +	igt_assert_f(ret == -ENOMEM || ret == -ENOSPC,
> +		     "Expected bind to fail with -ENOMEM/-ENOSPC, got %d\n", ret);
> +
> +	gem_close(fd, bo);
> +	xe_vm_destroy(fd, vm);
> +	drm_close_driver(fd);
> +}
> +
> +static void test_vm_fault_mode_overcommit(int fd, struct drm_xe_engine_class_instance *eci,
> +					  uint64_t vram_size, uint64_t overcommit_multiplier)
> +{
> +	uint64_t phys_mem = igt_get_total_ram_mb() << 20;
> +	uint64_t available_mem = igt_get_avail_ram_mb() << 20;
> +	uint64_t overcommit_size;
> +	uint32_t vm;
> +	uint32_t bo;
> +	uint64_t *ptr;
> +	int create_ret;
> +
> +	/* Limit overcommit to available memory to avoid OOM killer */
> +	overcommit_size = ALIGN(phys_mem * overcommit_multiplier, 4096);
Same as above. physical memory size defined in igt_fixture() which can 
be passed as argument in test_vm_fault_mode_overcommit()
> +	if (overcommit_size > available_mem) {
> +		igt_info("Limiting overcommit size from %llu MB to %llu MB (available)\n",
> +			 (unsigned long long)(overcommit_size >> 20),
> +			 (unsigned long long)(available_mem >> 20));
> +		overcommit_size = ALIGN(available_mem, 4096);
> +	}
> +
> +	/* Need at least some reasonable size to test */
> +	if (overcommit_size < (vram_size * 2)) {
> +		igt_skip("Insufficient memory for fault mode overcommit test\n");
> +		return;
> +	}
> +
> +	igt_info("Fault mode overcommit test: size=%llu MB, vram=%llu MB\n",
> +		 (unsigned long long)(overcommit_size >> 20),
> +		 (unsigned long long)(vram_size >> 20));
> +
> +	fd = drm_reopen_driver(fd);
fd already passed in function so why drm_reopen_driver()?
> +
> +	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE |
> +			  DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
> +	igt_assert(vm);
> +
> +	create_ret = __xe_bo_create(fd, 0, overcommit_size,
> +				    vram_memory(fd, eci->gt_id) | system_memory(fd),
> +				    DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM,
> +				    NULL, &bo);
> +	if (create_ret) {
> +		igt_info("BO creation failed (expected for overcommit): %s\n",
> +			 strerror(-create_ret));
why not igt_assert() if bo_create() failed with error?
> +		xe_vm_destroy(fd, vm);
> +		drm_close_driver(fd);
> +		return;
> +	}
> +
> +	ptr = xe_bo_map(fd, bo, overcommit_size);
> +	if (ptr == MAP_FAILED) {
> +		igt_info("BO mapping failed (expected for overcommit): %s\n",
> +			 strerror(errno));
Can't we assert here?
> +		gem_close(fd, bo);
> +		xe_vm_destroy(fd, vm);
> +		drm_close_driver(fd);
> +		return;
> +	}
> +
> +	/* Touch first page */
> +	memset(ptr, 0xAA, 4096);
> +
> +	/* Touch sparse pages to test fault handling - limit to avoid OOM */
> +	for (uint64_t off = 0; off < overcommit_size && off < (available_mem / 2);
This should be for (off = 0; off < overcommit_size; off += 4096) as page 
alignment above set is 4096 and we are checking whether pages in 
overcommit_size is accessible
> +	     off += (4096 * 256))
> +		((char *)ptr)[off] = 0xBB;
> +
> +	igt_info("Fault mode overcommit test completed successfully\n");
> +
> +	munmap(ptr, overcommit_size);
> +	gem_close(fd, bo);
> +	xe_vm_destroy(fd, vm);
> +	drm_close_driver(fd);
> +}
> +
>   static void
>   test_evict_cm(int fd, struct drm_xe_engine_class_instance *eci,
>   	      int n_exec_queues, int n_execs, size_t bo_size, unsigned long flags,
> @@ -665,7 +933,29 @@ static unsigned int working_set(uint64_t vram_size, uint64_t system_size,
>    * @beng-threads-large:		bind exec_queue threads large
>    *
>    */
> +/**
> + * SUBTEST: evict-vm-nonfault-overcommit
> + * Description: VM non-fault mode overcommit test - expects bind failure
> + * Test category: functionality test
> + * Feature: VM bind
> + */
>   
> +/**
> + * SUBTEST: evict-vm-fault-overcommit
> + * Description: VM fault mode overcommit test - touch pages to trigger faults
> + * Test category: functionality test
> + * Feature: VM bind, fault mode
> + */
> +/**
> + * SUBTEST: evict-%s
> + * Description: %arg[1] out-of-memory evict test - expects graceful failure
> + * Test category: functionality test
> + *
> + * arg[1]:
> + *
> + * @oom-graceful:       OOM graceful failure with small BOs
> + * @oom-graceful-large: OOM graceful failure with large BOs
> + */
>   /*
>    * Table driven test that attempts to cover all possible scenarios of eviction
>    * (small / large objects, compute mode vs non-compute VMs, external BO or BOs
> @@ -730,6 +1020,17 @@ int igt_main()
>   			MULTI_VM },
>   		{ NULL },
>   	};
> +	const struct section_oom {
> +		const char *name;
> +		int n_exec_queues;
> +		int mul;
> +		int div;
> +		unsigned int flags;
> +} sections_oom[] = {
> +	{ "oom-graceful", 1, 1, 128, BIND_EXEC_QUEUE },
> +	{ "oom-graceful-large", 1, 1, 16, BIND_EXEC_QUEUE },
> +	{ NULL },
> +};
>   	const struct section_threads {
>   		const char *name;
>   		int n_threads;
> @@ -836,6 +1137,14 @@ int igt_main()
>   		}
>   	}
>   
> +	igt_subtest("evict-vm-nonfault-overcommit") {
> +		test_vm_nonfault_mode_overcommit(fd, hwe, vram_size, 2);
> +	}
> +
> +	igt_subtest("evict-vm-fault-overcommit") {
> +		test_vm_fault_mode_overcommit(fd, hwe, vram_size, 2);
> +	}
> +
>   	for (const struct section_cm *s = sections_cm; s->name; s++) {
>   		igt_subtest_f("evict-%s", s->name) {
>   			uint64_t bo_size = calc_bo_size(vram_size, s->mul, s->div);
> @@ -862,6 +1171,27 @@ int igt_main()
>   				min(ws, s->n_execs), bo_size, s->flags);
>   		}
>   	}
> +	for (const struct section_oom *s = sections_oom; s->name; s++) {
> +		igt_subtest_f("evict-%s", s->name) {
> +			uint64_t bo_size = calc_bo_size(vram_size, s->mul, s->div);
> +			int n_execs = oom_working_set(vram_size, system_size, bo_size);
> +			int ret;
> +
> +			igt_info("OOM test: n_execs %d, bo_size %" PRIu64 " MiB\n",
> +				 n_execs, bo_size >> 20);
> +
> +			ret = test_evict_oom(fd, hwe, s->n_exec_queues, n_execs,
> +					     bo_size, s->flags);
> +
> +			/* Accept success or graceful OOM errors */
> +			igt_assert(ret == 0 || ret == -ENOSPC || ret == -ENOMEM);
> +			if (ret != 0)
> +				igt_info("Test passed: Got expected error %d (%s)\n",
> +					 ret, strerror(-ret));
> +			else
> +				igt_info("Test passed: All allocations and binds succeeded\n");
> +	}
> +}
>   
>   	igt_fixture()
>   		drm_close_driver(fd);

Let @Hellstrom, Thomas have a look on this.

Regards

Nishit

--------------LR7QE6gVNeKiU0B3P7qMm3Tk
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 1/13/2026 12:38 PM, Sobin Thomas
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260113070806.189718-2-sobin.thomas@intel.com">
      <pre wrap="" class="moz-quote-pre">The existing tests in xe_evict focuses on system-wide memory allocation
across multiple processes. However, OOM error handling in different VM
modes was not being tested, and the previous test_svm_overcommit() had
a critical bug that prevented proper overcommit scenarios.

Add three new tests to verify graceful OOM failure handling:

- test_evict_oom(): Allocates BOs aggressively in a loop until
  OOM occurs. Tests error handling in LR mode and expects
  -ENOSPC or -ENOMEM.

- test_vm_nonfault_mode_overcommit(): Verifies that non-fault mode VMs
  properly reject overcommit attempts with -ENOSPC or -ENOMEM as
  expected.

- test_vm_fault_mode_overcommit(): Validates that fault-mode VMs can
  handle memory pressure gracefully by touching pages to trigger page
  faults.

Signed-off-by: Sobin Thomas <a class="moz-txt-link-rfc2396E" href="mailto:sobin.thomas@intel.com">&lt;sobin.thomas@intel.com&gt;</a>
---
 tests/intel/xe_evict.c | 330 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 330 insertions(+)

diff --git a/tests/intel/xe_evict.c b/tests/intel/xe_evict.c
index 2350487c8..0f739ec7b 100644
--- a/tests/intel/xe_evict.c
+++ b/tests/intel/xe_evict.c
@@ -210,6 +210,274 @@ test_evict(int fd, struct drm_xe_engine_class_instance *eci,
 	drm_close_driver(fd);
 }
 
+static int
+test_evict_oom(int fd, struct drm_xe_engine_class_instance *eci,
+	       int n_exec_queues, int n_execs, size_t bo_size, unsigned long flags)
+{
+	uint32_t vm;
+	uint32_t bind_exec_queues[1] = { 0 };
+	uint64_t addr = 0x100000000;
+	uint64_t available_ram;
+	uint64_t total_alloc_size;
+	int bind_err = 0;
+	uint32_t *bo;
+	int i;
+	const size_t min_map_size = 4096;  /* Add constant with proper type */
+
+#define USER_FENCE_VALUE    0xdeadbeefdeadbeefull
+	struct drm_xe_sync sync[1] = {
+		{ .type = DRM_XE_SYNC_TYPE_USER_FENCE, .flags = DRM_XE_SYNC_FLAG_SIGNAL,
+		  .timeline_value = USER_FENCE_VALUE },
+	};
+
+	/* Check if we have enough system memory to proceed */
+	available_ram = igt_get_avail_ram_mb() &lt;&lt; 20;
+	/* Calculate total allocation size - now for full n_execs */
+	total_alloc_size = (uint64_t)n_execs * bo_size;
+
+	if (available_ram &lt; (total_alloc_size / 4)) {
+		igt_info(&quot;Insufficient memory to run OOM test safely\n&quot;);
+		return -ENOMEM;
+	}
+	if (total_alloc_size &gt; available_ram) {
+		int safe_n_execs = available_ram / bo_size;
+
+		safe_n_execs = ALIGN_DOWN(safe_n_execs, 4);
+		if (safe_n_execs &lt; 4) {
+			igt_info(&quot;Not enough memory to run OOM test\n&quot;);
+			return -ENOMEM;
+		}
+		igt_info(&quot;Reducing n_execs from %d to %d to fit in available memory\n&quot;,
+			 n_execs, safe_n_execs);
+		n_execs = safe_n_execs;
+		total_alloc_size = (uint64_t)n_execs * bo_size;
+	}
+	igt_info(&quot;OOM test: n_execs=%d, bo_size=%llu MB, total_alloc=%llu MB, available=%llu MB\n&quot;,
+		 n_execs, (unsigned long long)(bo_size &gt;&gt; 20),
+		 (unsigned long long)(total_alloc_size &gt;&gt; 20),
+		 (unsigned long long)(available_ram &gt;&gt; 20));
+
+	/* Allocate array for n_execs BOs */
+	bo = calloc(n_execs, sizeof(*bo));
+	igt_assert(bo);
+
+	fd = drm_reopen_driver(fd);
+
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
+	bind_exec_queues[0] = xe_bind_exec_queue_create(fd, vm, 0);
+
+	igt_info(&quot;\n n_execs = %d, bo_size = %zu\n&quot;, n_execs, bo_size);
+
+	/* Try to allocate and bind more than available memory */
+	for (i = 0; i &lt; n_execs; i++) {
+		uint32_t __bo;
+		struct {
+		uint64_t vm_sync;
+		} *data;
+		int create_ret;
+		size_t map_size;  /* Use size_t for map size */
+
+		/* Use __xe_bo_create to handle allocation failures gracefully */
+		create_ret = __xe_bo_create(fd, 0, bo_size, vram_memory(fd, eci-&gt;gt_id),
+					    DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM,
+					    NULL, &amp;__bo);
+		if (create_ret) {
+			bind_err = -errno;
+			igt_info(&quot;BO create failed at iteration %d with error %d (%s)\n&quot;,
+				 i, -bind_err, strerror(-bind_err));
+			break;
+		}
+
+		bo[i] = __bo;
+
+		/* Calculate map size with same types */
+		map_size = sizeof(*data) &gt; min_map_size ? sizeof(*data) : min_map_size;
+		data = xe_bo_map(fd, __bo, map_size);
+		sync[0].addr = to_user_pointer(&amp;data-&gt;vm_sync);
+		bind_err = __xe_vm_bind(fd, vm, bind_exec_queues[0], __bo, 0, addr,
+					bo_size, DRM_XE_VM_BIND_OP_MAP, 0, sync,
+					1, 0, 0, 0);
+		/* Attempt bind - should eventually fail with -ENOSPC or -ENOMEM */
+		if (bind_err) {
+			bind_err = -errno;
+			igt_info(&quot;Bind failed at iteration %d with error %d (%s)\n&quot;,
+				 i, -bind_err, strerror(-bind_err));
+			munmap(data, map_size);
+			gem_close(fd, __bo);
+			bo[i] = 0;
+			break;
+		}
+
+		xe_wait_ufence(fd, &amp;data-&gt;vm_sync, USER_FENCE_VALUE,
+			       bind_exec_queues[0], 20 * NSEC_PER_SEC);
+
+		/* Unmap with the same size we used for mapping */
+		munmap(data, map_size);
+		addr += bo_size;
+	}
+
+	/* Cleanup allocated BOs - iterate through all n_execs */
+	for (int j = 0; j &lt; n_execs; j++) {
+		if (bo[j])
+			gem_close(fd, bo[j]);
+	}
+
+	xe_exec_queue_destroy(fd, bind_exec_queues[0]);
+	xe_vm_destroy(fd, vm);
+	drm_close_driver(fd);
+	free(bo);
+
+	return bind_err;
+}
+
+static unsigned int oom_working_set(uint64_t vram_size, uint64_t system_size,
+				    uint64_t bo_size)
+{
+	uint64_t target_allocation;
+	unsigned int set_size;
+
+	/*
+	 * For VRAM eviction testing, we want to allocate MORE than VRAM size
+	 * to force eviction to system memory. Target 150-200% of VRAM.
+	 * The BOs are created with VRAM placement, so they'll initially go to VRAM
+	 * and then get evicted to system when VRAM fills up.
+	 */
+	target_allocation = (vram_size * 150) / 100;  /* 150% of VRAM */
+
+	/* But ensure we don't exceed available system memory */
+	if (target_allocation &gt; (system_size * 80) / 100) {
+		target_allocation = (system_size * 80) / 100;
+		igt_info(&quot;Limited by system memory: reducing target from %llu MB to %llu MB\n&quot;,
+			 (unsigned long long)((vram_size * 150 / 100) &gt;&gt; 20),
+			 (unsigned long long)(target_allocation &gt;&gt; 20));
+	}
+
+	set_size = target_allocation / bo_size;
+
+	igt_info(&quot;VRAM stress calculation: vram_size=%&quot; PRIu64 &quot; MB, system=%&quot; PRIu64 &quot; MB, &quot;
+		 &quot;target_alloc=%&quot; PRIu64 &quot; MB (%.1f%% of VRAM), bo_size=%&quot; PRIu64 &quot; MB, set_size=%u\n&quot;,
+		 (uint64_t)(vram_size &gt;&gt; 20), (uint64_t)(system_size &gt;&gt; 20),
+		 (uint64_t)(target_allocation &gt;&gt; 20),
+		 (double)(target_allocation * 100) / vram_size,
+		 (uint64_t)(bo_size &gt;&gt; 20), set_size);
+
+	return ALIGN_DOWN(set_size, 4);
+}
+
+static void
+test_vm_nonfault_mode_overcommit(int fd, struct drm_xe_engine_class_instance *eci,
+				 uint64_t vram_size, uint64_t overcommit_multiplier)
+{
+	uint32_t bo;
+	uint64_t phys_mem;
+	uint64_t overcommit_size;
+	uint32_t vm;
+	int ret, cret;
+
+	fd = drm_open_driver(DRIVER_XE);</pre>
    </blockquote>
    fd already passed from calling function. So no need to call
    drm_open_driver() again
    <blockquote type="cite" cite="mid:20260113070806.189718-2-sobin.thomas@intel.com">
      <pre wrap="" class="moz-quote-pre">
+	phys_mem = (uint64_t)igt_get_total_ram_mb() &lt;&lt; 20;</pre>
    </blockquote>
    system_size defined in igt_fixture() which can be passed as argument
    in test_vm_nonfault_mode_overcommit() and can be used.
    <blockquote type="cite" cite="mid:20260113070806.189718-2-sobin.thomas@intel.com">
      <pre wrap="" class="moz-quote-pre">
+	igt_info(&quot;Total system memory = %llu MB\n&quot;, (unsigned long long)phys_mem);
+	overcommit_size = ALIGN(phys_mem * 2, 4096);
+	vm = xe_vm_create(fd, 0, 0);
+	cret = __xe_bo_create(fd, vm, overcommit_size,
+			      vram_memory(fd, eci-&gt;gt_id) | system_memory(fd),
+			      0, NULL, &amp;bo);
+	if (cret) {
+		igt_assert_f(errno == E2BIG || errno == ENOMEM || errno == ENOSPC,
+			     &quot;xe_bo_create failed with unexpected errno=%d (%s)\n&quot;,
+			     errno, strerror(errno));
+		igt_info(&quot;Non-fault overcommit: BO create failed as expected: %d (%s)\n&quot;,
+			 errno, strerror(errno));</pre>
    </blockquote>
    is it expected to get error code apart from E2BIG, ENOMEM and ENOSPC
    which is being printed in igt_info? If it's not then igt_info can be
    removed as error code printing and test halt done in igt_assert().
    <blockquote type="cite" cite="mid:20260113070806.189718-2-sobin.thomas@intel.com">
      <pre wrap="" class="moz-quote-pre">
+		xe_vm_destroy(fd, vm);
+		drm_close_driver(fd);
+		return;
+	}
+
+	ret = __xe_vm_bind(fd, vm, 0, bo, 0, 0x100000000,
+			   overcommit_size, DRM_XE_VM_BIND_OP_MAP, 0,
+			   NULL, 0, 0, 0, 0);</pre>
    </blockquote>
    We can use 6th argument which is offset as 0 so that it can take
    address to bind overcommit_size automatically
    <blockquote type="cite" cite="mid:20260113070806.189718-2-sobin.thomas@intel.com">
      <pre wrap="" class="moz-quote-pre">
+	igt_assert_f(ret == -ENOMEM || ret == -ENOSPC,
+		     &quot;Expected bind to fail with -ENOMEM/-ENOSPC, got %d\n&quot;, ret);
+
+	gem_close(fd, bo);
+	xe_vm_destroy(fd, vm);
+	drm_close_driver(fd);
+}
+
+static void test_vm_fault_mode_overcommit(int fd, struct drm_xe_engine_class_instance *eci,
+					  uint64_t vram_size, uint64_t overcommit_multiplier)
+{
+	uint64_t phys_mem = igt_get_total_ram_mb() &lt;&lt; 20;
+	uint64_t available_mem = igt_get_avail_ram_mb() &lt;&lt; 20;
+	uint64_t overcommit_size;
+	uint32_t vm;
+	uint32_t bo;
+	uint64_t *ptr;
+	int create_ret;
+
+	/* Limit overcommit to available memory to avoid OOM killer */
+	overcommit_size = ALIGN(phys_mem * overcommit_multiplier, 4096);</pre>
    </blockquote>
    Same as above. physical memory size defined in igt_fixture() which
    can be passed as argument in test_vm_fault_mode_overcommit()
    <blockquote type="cite" cite="mid:20260113070806.189718-2-sobin.thomas@intel.com">
      <pre wrap="" class="moz-quote-pre">
+	if (overcommit_size &gt; available_mem) {
+		igt_info(&quot;Limiting overcommit size from %llu MB to %llu MB (available)\n&quot;,
+			 (unsigned long long)(overcommit_size &gt;&gt; 20),
+			 (unsigned long long)(available_mem &gt;&gt; 20));
+		overcommit_size = ALIGN(available_mem, 4096);
+	}
+
+	/* Need at least some reasonable size to test */
+	if (overcommit_size &lt; (vram_size * 2)) {
+		igt_skip(&quot;Insufficient memory for fault mode overcommit test\n&quot;);
+		return;
+	}
+
+	igt_info(&quot;Fault mode overcommit test: size=%llu MB, vram=%llu MB\n&quot;,
+		 (unsigned long long)(overcommit_size &gt;&gt; 20),
+		 (unsigned long long)(vram_size &gt;&gt; 20));
+
+	fd = drm_reopen_driver(fd);</pre>
    </blockquote>
    fd already passed in function so why drm_reopen_driver()?
    <blockquote type="cite" cite="mid:20260113070806.189718-2-sobin.thomas@intel.com">
      <pre wrap="" class="moz-quote-pre">
+
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE |
+			  DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
+	igt_assert(vm);
+
+	create_ret = __xe_bo_create(fd, 0, overcommit_size,
+				    vram_memory(fd, eci-&gt;gt_id) | system_memory(fd),
+				    DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM,
+				    NULL, &amp;bo);
+	if (create_ret) {
+		igt_info(&quot;BO creation failed (expected for overcommit): %s\n&quot;,
+			 strerror(-create_ret));</pre>
    </blockquote>
    why not igt_assert() if bo_create() failed with error?
    <blockquote type="cite" cite="mid:20260113070806.189718-2-sobin.thomas@intel.com">
      <pre wrap="" class="moz-quote-pre">
+		xe_vm_destroy(fd, vm);
+		drm_close_driver(fd);
+		return;
+	}
+
+	ptr = xe_bo_map(fd, bo, overcommit_size);
+	if (ptr == MAP_FAILED) {
+		igt_info(&quot;BO mapping failed (expected for overcommit): %s\n&quot;,
+			 strerror(errno));</pre>
    </blockquote>
    Can't we assert here?
    <blockquote type="cite" cite="mid:20260113070806.189718-2-sobin.thomas@intel.com">
      <pre wrap="" class="moz-quote-pre">
+		gem_close(fd, bo);
+		xe_vm_destroy(fd, vm);
+		drm_close_driver(fd);
+		return;
+	}
+
+	/* Touch first page */
+	memset(ptr, 0xAA, 4096);
+
+	/* Touch sparse pages to test fault handling - limit to avoid OOM */
+	for (uint64_t off = 0; off &lt; overcommit_size &amp;&amp; off &lt; (available_mem / 2);</pre>
    </blockquote>
    This should be&nbsp;<!--[if gte mso 9]><xml>
 <w:WordDocument>
  <w:View>Normal</w:View>
  <w:Zoom>0</w:Zoom>
  <w:TrackMoves/>
  <w:TrackFormatting/>
  <w:PunctuationKerning/>
  <w:ValidateAgainstSchemas/>
  <w:SaveIfXMLInvalid>false</w:SaveIfXMLInvalid>
  <w:IgnoreMixedContent>false</w:IgnoreMixedContent>
  <w:AlwaysShowPlaceholderText>false</w:AlwaysShowPlaceholderText>
  <w:DoNotPromoteQF/>
  <w:LidThemeOther>EN-US</w:LidThemeOther>
  <w:LidThemeAsian>X-NONE</w:LidThemeAsian>
  <w:LidThemeComplexScript>X-NONE</w:LidThemeComplexScript>
  <w:Compatibility>
   <w:BreakWrappedTables/>
   <w:SnapToGridInCell/>
   <w:WrapTextWithPunct/>
   <w:UseAsianBreakRules/>
   <w:DontGrowAutofit/>
   <w:SplitPgBreakAndParaMark/>
   <w:EnableOpenTypeKerning/>
   <w:DontFlipMirrorIndents/>
   <w:OverrideTableStyleHps/>
  </w:Compatibility>
  <w:BrowserLevel>MicrosoftInternetExplorer4</w:BrowserLevel>
  <m:mathPr>
   <m:mathFont m:val="Cambria Math"/>
   <m:brkBin m:val="before"/>
   <m:brkBinSub m:val="&#45;-"/>
   <m:smallFrac m:val="off"/>
   <m:dispDef/>
   <m:lMargin m:val="0"/>
   <m:rMargin m:val="0"/>
   <m:defJc m:val="centerGroup"/>
   <m:wrapIndent m:val="1440"/>
   <m:intLim m:val="subSup"/>
   <m:naryLim m:val="undOvr"/>
  </m:mathPr></w:WordDocument>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <w:LatentStyles DefLockedState="false" DefUnhideWhenUsed="false"
  DefSemiHidden="false" DefQFormat="false" DefPriority="99"
  LatentStyleCount="376">
  <w:LsdException Locked="false" Priority="0" QFormat="true" Name="Normal"/>
  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 1"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 2"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 3"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 4"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 5"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 6"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 7"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 8"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 9"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 6"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 7"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 8"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 9"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 1"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 2"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 3"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 4"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 5"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 6"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 7"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 8"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 9"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Normal Indent"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="footnote text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="annotation text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="header"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="footer"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index heading"/>
  <w:LsdException Locked="false" Priority="35" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="caption"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="table of figures"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="envelope address"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="envelope return"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="footnote reference"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="annotation reference"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="line number"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="page number"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="endnote reference"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="endnote text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="table of authorities"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="macro"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="toa heading"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number 5"/>
  <w:LsdException Locked="false" Priority="10" QFormat="true" Name="Title"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Closing"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Signature"/>
  <w:LsdException Locked="false" Priority="1" SemiHidden="true"
   UnhideWhenUsed="true" Name="Default Paragraph Font"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text Indent"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Message Header"/>
  <w:LsdException Locked="false" Priority="11" QFormat="true" Name="Subtitle"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Salutation"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Date"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text First Indent"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text First Indent 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Note Heading"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text Indent 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text Indent 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Block Text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Hyperlink"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="FollowedHyperlink"/>
  <w:LsdException Locked="false" Priority="22" QFormat="true" Name="Strong"/>
  <w:LsdException Locked="false" Priority="20" QFormat="true" Name="Emphasis"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Document Map"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Plain Text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="E-mail Signature"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Top of Form"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Bottom of Form"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Normal (Web)"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Acronym"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Address"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Cite"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Code"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Definition"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Keyboard"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Preformatted"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Sample"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Typewriter"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Variable"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Normal Table"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="annotation subject"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="No List"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Outline List 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Outline List 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Outline List 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Simple 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Simple 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Simple 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Classic 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Classic 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Classic 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Classic 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Colorful 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Colorful 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Colorful 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 6"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 7"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 8"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 6"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 7"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 8"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table 3D effects 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table 3D effects 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table 3D effects 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Contemporary"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Elegant"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Professional"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Subtle 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Subtle 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Web 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Web 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Web 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Balloon Text"/>
  <w:LsdException Locked="false" Priority="39" Name="Table Grid"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Theme"/>
  <w:LsdException Locked="false" SemiHidden="true" Name="Placeholder Text"/>
  <w:LsdException Locked="false" Priority="1" QFormat="true" Name="No Spacing"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 1"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 1"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 1"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 1"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 1"/>
  <w:LsdException Locked="false" SemiHidden="true" Name="Revision"/>
  <w:LsdException Locked="false" Priority="34" QFormat="true"
   Name="List Paragraph"/>
  <w:LsdException Locked="false" Priority="29" QFormat="true" Name="Quote"/>
  <w:LsdException Locked="false" Priority="30" QFormat="true"
   Name="Intense Quote"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 1"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 1"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 1"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 1"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 1"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 1"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 2"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 2"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 2"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 2"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 2"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 2"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 2"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 2"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 2"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 2"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 2"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 3"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 3"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 3"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 3"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 3"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 3"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 3"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 3"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 3"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 3"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 3"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 4"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 4"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 4"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 4"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 4"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 4"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 4"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 4"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 4"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 4"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 4"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 5"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 5"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 5"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 5"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 5"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 5"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 5"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 5"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 5"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 5"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 5"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 6"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 6"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 6"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 6"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 6"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 6"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 6"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 6"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 6"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 6"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 6"/>
  <w:LsdException Locked="false" Priority="19" QFormat="true"
   Name="Subtle Emphasis"/>
  <w:LsdException Locked="false" Priority="21" QFormat="true"
   Name="Intense Emphasis"/>
  <w:LsdException Locked="false" Priority="31" QFormat="true"
   Name="Subtle Reference"/>
  <w:LsdException Locked="false" Priority="32" QFormat="true"
   Name="Intense Reference"/>
  <w:LsdException Locked="false" Priority="33" QFormat="true" Name="Book Title"/>
  <w:LsdException Locked="false" Priority="37" SemiHidden="true"
   UnhideWhenUsed="true" Name="Bibliography"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="TOC Heading"/>
  <w:LsdException Locked="false" Priority="41" Name="Plain Table 1"/>
  <w:LsdException Locked="false" Priority="42" Name="Plain Table 2"/>
  <w:LsdException Locked="false" Priority="43" Name="Plain Table 3"/>
  <w:LsdException Locked="false" Priority="44" Name="Plain Table 4"/>
  <w:LsdException Locked="false" Priority="45" Name="Plain Table 5"/>
  <w:LsdException Locked="false" Priority="40" Name="Grid Table Light"/>
  <w:LsdException Locked="false" Priority="46" Name="Grid Table 1 Light"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark"/>
  <w:LsdException Locked="false" Priority="51" Name="Grid Table 6 Colorful"/>
  <w:LsdException Locked="false" Priority="52" Name="Grid Table 7 Colorful"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 1"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 1"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 1"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 1"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 1"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 1"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 2"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 2"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 2"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 2"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 2"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 2"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 3"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 3"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 3"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 3"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 3"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 3"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 4"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 4"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 4"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 4"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 4"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 4"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 5"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 5"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 5"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 5"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 5"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 5"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 6"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 6"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 6"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 6"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 6"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 6"/>
  <w:LsdException Locked="false" Priority="46" Name="List Table 1 Light"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark"/>
  <w:LsdException Locked="false" Priority="51" Name="List Table 6 Colorful"/>
  <w:LsdException Locked="false" Priority="52" Name="List Table 7 Colorful"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 1"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 1"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 1"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 1"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 1"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 1"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 2"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 2"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 2"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 2"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 2"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 2"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 3"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 3"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 3"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 3"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 3"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 3"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 4"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 4"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 4"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 4"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 4"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 4"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 5"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 5"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 5"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 5"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 5"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 5"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 6"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 6"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 6"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 6"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 6"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 6"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Mention"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Smart Hyperlink"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Hashtag"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Unresolved Mention"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Smart Link"/>
 </w:LatentStyles>
</xml><![endif]--><!--[if gte mso 10]>
<style>
 /* Style Definitions */
 table.MsoNormalTable
	{mso-style-name:"Table Normal";
	mso-tstyle-rowband-size:0;
	mso-tstyle-colband-size:0;
	mso-style-noshow:yes;
	mso-style-priority:99;
	mso-style-parent:"";
	mso-padding-alt:0in 5.4pt 0in 5.4pt;
	mso-para-margin:0in;
	mso-pagination:widow-orphan;
	font-size:10.0pt;
	font-family:"Times New Roman",serif;}
</style>
<![endif]--><span style="font-size:12.0pt;font-family:&quot;Aptos&quot;,sans-serif;
mso-fareast-font-family:Aptos;mso-fareast-theme-font:minor-latin;mso-bidi-font-family:
Aptos;mso-ligatures:standardcontextual;mso-ansi-language:EN-US;mso-fareast-language:
EN-US;mso-bidi-language:AR-SA">for (off = 0; off &lt; overcommit_size;
      off += 4096) as page alignment above set is 4096 and we are
      checking whether pages in overcommit_size is accessible</span>
    <blockquote type="cite" cite="mid:20260113070806.189718-2-sobin.thomas@intel.com">
      <pre wrap="" class="moz-quote-pre">
+	     off += (4096 * 256))
+		((char *)ptr)[off] = 0xBB;
+
+	igt_info(&quot;Fault mode overcommit test completed successfully\n&quot;);
+
+	munmap(ptr, overcommit_size);
+	gem_close(fd, bo);
+	xe_vm_destroy(fd, vm);
+	drm_close_driver(fd);
+}
+
 static void
 test_evict_cm(int fd, struct drm_xe_engine_class_instance *eci,
 	      int n_exec_queues, int n_execs, size_t bo_size, unsigned long flags,
@@ -665,7 +933,29 @@ static unsigned int working_set(uint64_t vram_size, uint64_t system_size,
  * @beng-threads-large:		bind exec_queue threads large
  *
  */
+/**
+ * SUBTEST: evict-vm-nonfault-overcommit
+ * Description: VM non-fault mode overcommit test - expects bind failure
+ * Test category: functionality test
+ * Feature: VM bind
+ */
 
+/**
+ * SUBTEST: evict-vm-fault-overcommit
+ * Description: VM fault mode overcommit test - touch pages to trigger faults
+ * Test category: functionality test
+ * Feature: VM bind, fault mode
+ */
+/**
+ * SUBTEST: evict-%s
+ * Description: %arg[1] out-of-memory evict test - expects graceful failure
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @oom-graceful:       OOM graceful failure with small BOs
+ * @oom-graceful-large: OOM graceful failure with large BOs
+ */
 /*
  * Table driven test that attempts to cover all possible scenarios of eviction
  * (small / large objects, compute mode vs non-compute VMs, external BO or BOs
@@ -730,6 +1020,17 @@ int igt_main()
 			MULTI_VM },
 		{ NULL },
 	};
+	const struct section_oom {
+		const char *name;
+		int n_exec_queues;
+		int mul;
+		int div;
+		unsigned int flags;
+} sections_oom[] = {
+	{ &quot;oom-graceful&quot;, 1, 1, 128, BIND_EXEC_QUEUE },
+	{ &quot;oom-graceful-large&quot;, 1, 1, 16, BIND_EXEC_QUEUE },
+	{ NULL },
+};
 	const struct section_threads {
 		const char *name;
 		int n_threads;
@@ -836,6 +1137,14 @@ int igt_main()
 		}
 	}
 
+	igt_subtest(&quot;evict-vm-nonfault-overcommit&quot;) {
+		test_vm_nonfault_mode_overcommit(fd, hwe, vram_size, 2);
+	}
+
+	igt_subtest(&quot;evict-vm-fault-overcommit&quot;) {
+		test_vm_fault_mode_overcommit(fd, hwe, vram_size, 2);
+	}
+
 	for (const struct section_cm *s = sections_cm; s-&gt;name; s++) {
 		igt_subtest_f(&quot;evict-%s&quot;, s-&gt;name) {
 			uint64_t bo_size = calc_bo_size(vram_size, s-&gt;mul, s-&gt;div);
@@ -862,6 +1171,27 @@ int igt_main()
 				min(ws, s-&gt;n_execs), bo_size, s-&gt;flags);
 		}
 	}
+	for (const struct section_oom *s = sections_oom; s-&gt;name; s++) {
+		igt_subtest_f(&quot;evict-%s&quot;, s-&gt;name) {
+			uint64_t bo_size = calc_bo_size(vram_size, s-&gt;mul, s-&gt;div);
+			int n_execs = oom_working_set(vram_size, system_size, bo_size);
+			int ret;
+
+			igt_info(&quot;OOM test: n_execs %d, bo_size %&quot; PRIu64 &quot; MiB\n&quot;,
+				 n_execs, bo_size &gt;&gt; 20);
+
+			ret = test_evict_oom(fd, hwe, s-&gt;n_exec_queues, n_execs,
+					     bo_size, s-&gt;flags);
+
+			/* Accept success or graceful OOM errors */
+			igt_assert(ret == 0 || ret == -ENOSPC || ret == -ENOMEM);
+			if (ret != 0)
+				igt_info(&quot;Test passed: Got expected error %d (%s)\n&quot;,
+					 ret, strerror(-ret));
+			else
+				igt_info(&quot;Test passed: All allocations and binds succeeded\n&quot;);
+	}
+}
 
 	igt_fixture()
 		drm_close_driver(fd);</pre>
    </blockquote>
    <p>Let @Hellstrom, Thomas have a look on this.&nbsp;</p>
    <p>Regards</p>
    <p>Nishit</p>
    <blockquote type="cite" cite="mid:20260113070806.189718-2-sobin.thomas@intel.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
    </blockquote>
  </body>
</html>

--------------LR7QE6gVNeKiU0B3P7qMm3Tk--
