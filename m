Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25664CC6B38
	for <igt-dev@archiver.kernel.org>; Fri, 16 Oct 2026 05:36:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C316B10E1D1;
	Fri, 16 Oct 2026 05:36:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BD6910E1D1
 for <igt-dev@lists.freedesktop.org>; Fri, 16 Oct 2026 05:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792128944; x=1823664944;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=3QiYmy9xRg3ezTXLh5kxfdM92oSRAJEBxSIoqfu4u8Q=;
 b=bD4ajmjn3/yTT+PmXagsK0ApNUZDqel2ObpsRVxU6SZ1Nelft8fro3Yi
 XeB49aBDk/L6osXaAJmb2jVSmjL6noSV6/QiCA93/vUxXVw0P7SabX5K9
 fTFZsE5nRKJEn0sRp7PGlt1hIZK0iDJfm2D/pFbdQTp5Qd+GJtvf3bgsy
 FXBL/Qfz/yVkmdfN3lGxLbl5xtreYeLjCGo/YnqBLan2sQzsPjU+Vinct
 X6DE8r5SOWp+nAeCPZO/SJMrbJKZaJVNvK9XrDCZEJ1gMfoH+yKu6ELE1
 BiEwH7WIqh9NxoKdn4JzV1QUl1hPl8nRPLWi2Ui93Zha9A0OhcIcvc9oV Q==;
X-CSE-ConnectionGUID: ETKRL+S1TYetv2kyJHovxg==
X-CSE-MsgGUID: 8m6lqQSIQ7Gj9wbo9bdGFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="911199"
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="911199"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 22:35:44 -0700
X-CSE-ConnectionGUID: a/bouExwTleHVe/L6+MaBw==
X-CSE-MsgGUID: 3y6oW83jTrGe3ld767X42A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="1940794"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 22:35:42 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 15 Oct 2026 22:35:42 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 15 Oct 2026 22:35:42 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.71)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 15 Oct 2026 22:35:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jpBOkCkK/Dmx9pUExVqw1svXCFvuOl2Dr1bdnO2mND78McyfF6Sq4HOxU2IM2KZYKr1lXaEU+QYdFfw+dwGfIxr7OrWalGVhLZu8ADHe7gkHb0HATS5xpW3bf7OtOF0h6l2+3y+F/Bzq/jXpvnDqpUlT3riN5WhH7bvIw8m7RySUIVgca40PJW+SdPmTSkOQfn93koqjgsdMO7DS26C37Tfx8RUrHR4kQWygaSXeV8rDu4oLEqvJAzvMyi/T5kQ0pR9s5kyP6UJC9fCJnGg8PdRrFTdBWVjTNNEZ4sezuWzFF35ChkZo5suuVPA4AIK9Xj1VrLR9CB853tFK/b+sJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fCl46f9uhVo0Kmc4m7zYt+qGaygJm/TGGYZE+O8KsUY=;
 b=NamSCKq2I5uEoazAUymce2pgIpWgav4HKHXKeS9nbA6BRnQ5RMHjEjY/PELkEy3KaXEWGBaMU3WNOxubA8lqs34kO3erQ1WSRT5FX5KBZeTt9QCfE7YMb8FHLTuuqg/ElC9rrEeRJWpthe1W0KQ2ucahiexQSePxMzleK7W4/U8J3eDCE7UyCG9oYXqsUmtHk6SNgBllRr2McYXJGsqQ3IJA6kiiK4Hxku6FGQYSU+pkbTwcNmsNQmmm28P3SA41+DePwd+OoFFcHtYZb3PLl0EsUWex8dL33mS7pappsxp4yL97ZVSKBPiCZcgxZ2XTgR7uJBJHQz6y7UAWltjPoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 PH8PR11MB7023.namprd11.prod.outlook.com (2603:10b6:510:221::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.12; Fri, 16 Oct
 2026 05:35:11 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%5]) with mapi id 15.21.0472.016; Fri, 16 Oct 2026
 05:35:11 +0000
Message-ID: <f5584f42-6f36-4dc9-bf7b-6e7c7b4385fa@intel.com>
Date: Fri, 16 Oct 2026 11:05:01 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/intel/xe_wedged: ignore expected CORE_COMPUTE error
 in dmesg
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, Mallesh Koujalagi
 <mallesh.koujalagi@intel.com>, <igt-dev@lists.freedesktop.org>,
 <anshuman.gupta@intel.com>, <vinay.belgaumkar@intel.com>,
 <badal.nilawar@intel.com>, <karthik.poosa@intel.com>, <sk.anirban@intel.com>, 
 <raag.jadav@intel.com>, Nishit Sharma <nishit.sharma@intel.com>, "Shuicheng
 Lin" <shuicheng.lin@intel.com>
References: <20261014115047.352174-2-mallesh.koujalagi@intel.com>
 <20261014132143.k3z6i2aqzsv3cnyi@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <20261014132143.k3z6i2aqzsv3cnyi@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0178.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::7) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|PH8PR11MB7023:EE_
X-MS-Office365-Filtering-Correlation-Id: 25c776ba-a0d3-4e5f-8cb1-08df2b473eb2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|376014|366016|56012099006|4143699003|22082099003|18002099003|921020|11063799006|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info: L9/n9y01BTTZ0IXpEcEUVLpD1Zp/Kb7d4QZ8rZujs6r+lmoUkXlT1kgThMqlT1dvORZ10PAVnHC/E43jiJk8HKvTFQHNdV9NQbE8gDVh05Ep1ngSAdMhDatraq1E6COMWDr/3YyAqajpEqQnSfnkalesjs/mXHdpdE1mrhzqFB65D6vGEZeXCx2f6giCWaGt23Ro5Vgmmga/cjI2NCQeXBg88xC2JHjb7br3W8ApRk2xRN/9AzJjlB6II03TA9nbuOMflKdkbuDelqVOXOdFSV734bv2Ze5Q8D35jaIk6PIAeU6G+TBpsvSxt0Lapid0qz7y8+9b/kCnu5Dn8M4HVJrSsFZGmtovgUwoWTG45maEYSIT7mJt2xZbSfxA/RxSkqOH2ryBqoiXNPEJD7nqe+tVlFte6+tUJ59r+c7YOhgBz+13Yd/uQIYXXirq606sWYHmCBZUfCLRCaVKM0WXGR/GyH68X2w0zDDZQ9Znt3QkVcrnEo6L7lYdlZ7UGSWWSp2/7xvpyaD8trJZGDoS8dkY/cGNufiH6d2WW8klYG40Ar+oqNuRorsR9sZUl5c58N5I/b9A50WPrIa9QsXrrEW78wqfBB1Y0nm5Qos5OtrV2MZdWAiVFjPm10a7fs9X0wcgCUA0someMdDwNKy9g4OXmyEJK3ztO4hQ3OR10hzLYYktiAKO/hTEwbinptf6F+Ic07m8Nsvnz/ohjMKIGA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(56012099006)(4143699003)(22082099003)(18002099003)(921020)(11063799006)(6133799003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ak1YcE85cmFUSmF2QXMrQXJvQ1dTZUNla3VZRWF3UGt6Y05nY0N6OCtRKyt4?=
 =?utf-8?B?TDErS25oNXhjL0g1WFNvc1pLUERDNytUYTEvemM3bzdIL1A0N3hvMUFwSnNS?=
 =?utf-8?B?cGlKdFF5ZlVPRXZ6VGlWbWROa0RNZDUxb09BZEp3b2ZmWU9STUdhOWFsQlJk?=
 =?utf-8?B?SXMzeHcvdm00SExuMVdsamVRbUJIZ0txK0dMZWdTR2ZZSm9iTUhHd29KeWVy?=
 =?utf-8?B?SmNlMTJhU2ZEcG9hN0hWYXYzeUZqMU14L3AwRXBXZU5pTE5PUk04dHM4ZVlS?=
 =?utf-8?B?ci8zUVJ1b3V5WmNFM29qbjJEZzdxZDZNZGlEbmFYODNteDNxTWJrZHZBSVEw?=
 =?utf-8?B?bmNnWFF2TkE2OHVySkFqS1FOVnlMTHF6am4wSFJVZ21QeUtZUStmZEpsQ0hw?=
 =?utf-8?B?V3MxeS9nQkJiSkRycFp3Z0J6bmFxeHhiemJvQmNOUTRvZHJuSzNaM1doY2tV?=
 =?utf-8?B?SStNOW1COGt3ajhSZnkxYmN1UmIxMG53d2xWRGdTYVFMY1lGLzN0R09yOVRN?=
 =?utf-8?B?Qm9COXFORHJqT3BnM29ja3cxbVJVRkZucTl5M1R2elRIY3R5ODV2TGt5Qy95?=
 =?utf-8?B?SHNRVTF4NmE1ODVYU3dtQ1FPdnFuNTV1R0FLTU85ZlpWQlJLeVNKQVEyYU5D?=
 =?utf-8?B?Tnd3WE83Zlo1WHBrVnNZdm1nOXVSc3BTMnVScTRoVTVydHIrMzdEeCtvbnlt?=
 =?utf-8?B?NzVadWJUM29nbi9qb3BoTC9aYVVLaFcyUWszYWg3eE11VmdKbkg1dkxXbTRI?=
 =?utf-8?B?QUI4OCtpc3dhTk9FREVldE9nZVorNkRvVHU4aXlGL1ZKcmN3Zy9LajRVcDI0?=
 =?utf-8?B?VDUvYzVaME5qakZTOUVKc21qd1cwSmlCRmlpSVBucVlYY3F5VnM5MjJXeGN0?=
 =?utf-8?B?cTJOWnhHN250bmhYU1orR1VNcHZLRHZZaGp1RGN5SWd5bWphbHRFRERpS3ov?=
 =?utf-8?B?eTdGUjJxUGs0RlNocjFOMlVaVUNHam01ZzloOWhFcEZjUVY3VzgrcmFEQ3Fm?=
 =?utf-8?B?amlkelA1WDZWQktjM1BBQWo4WTZkRlRoTjZydnFTcmYxSlFGTXVSamlpZVRD?=
 =?utf-8?B?bnEwOHJmckgrV0M5MzN4TXhNbkozbll5RnRxTFlRbWt3YXRFSHZVb1dCc0VE?=
 =?utf-8?B?bXhQQ3dOMWlUeUVMNW5Vdm4wY093TGhkVThIOHBwRlRYU1Q5Q2dQMjRVOTJv?=
 =?utf-8?B?QUhrS2QzM25XbUV4d2ZQVmZZbGQ2cUF1Q3dlcytTWHdUMlQrUTFpR1k2eCtp?=
 =?utf-8?B?NTB6NjlsdXViZDlNb1JLTkJVc242SU53eFg4Vnh2YnZtQk95L0VsRDZ5a21Q?=
 =?utf-8?B?R2ZhaThvVWp1QjcxQldtN0pRQi9pYk9pVW9zMHBVdDJkNTNDcFVmcFpVcXQr?=
 =?utf-8?B?Z2dEbDFJbmZTT1BBWStVOFF2STZsOUx0MCs0OHU3ODNicFVEenJ5b21lNzRV?=
 =?utf-8?B?cDRwTUlBL2Z4Q0R2OE9MYVVScmFYLzRnNDVGRmxYRUlzNVBOKzQwVXdhNU1S?=
 =?utf-8?B?Q2N6bUk1ajlROFpaY2FXejAyOW9LNnVXMWV0VEgyT1lZeVpmVnpxblhOaTJP?=
 =?utf-8?B?dUo3ZWxtd2UrVkY5T250Um1xWmxrRWVwclg5ODI5Z0t4eFFNNTZCaEN6emlX?=
 =?utf-8?B?SGRZMXRXeGRuYU9wbFlGU2p2T29VZFV4U1RUanhtUWFkQ3RyakpaWkMxSzBp?=
 =?utf-8?B?RGZUcEwzUk5aNysxSElrUU0rUkNpOG9nd3JtdHI1Y2JiV0t5Q3RnUXFxMlJw?=
 =?utf-8?B?QUV0VktDdTdLVFdXOXpOWjJsblJoVXV1emZVNlRsOUpldVc1QmJMUFZMOEEw?=
 =?utf-8?B?R3p1alpJVzl3eDZXV0JCTGswZCtGM3ByeTRBN1lNYXVjRWErVjM3Wkx5Wk96?=
 =?utf-8?B?WE9TYitBbGVobnpxNFd3K1BZN21lL09SYmhKeFk5dlEva0QyWTFLaUdRU2xW?=
 =?utf-8?B?UlgzS2tzRzIzem1YWUFmMCs3VUUyaXB5ckFwTUhvN1E4c1FRZ1dHZ1ZIYi9L?=
 =?utf-8?B?elUxZjlxQlFuM1lNVnhxN1NsajFVazhiaU82S3hDa3pvUnJFZDltMVA3L1Z6?=
 =?utf-8?B?NWI2T3dKS0xqbUptbk9LTlluK0tOYUExTzdUcVVOR2Yvakx3RGtrbU1aaUpP?=
 =?utf-8?B?QlFJR3phUEsxZ2NiWlpjSVd4OCsrRlYrN1lFRXMvUnEzeWZCbUs0Ti9XV0Zq?=
 =?utf-8?B?K2hwVmlIc2xWYVlRN21GR0pURHQrM2xRL3p6SWh5aWxUVHdLcmIveVhhWWgw?=
 =?utf-8?B?N1pMMDdZaGRJUjJLWVRidmphT2w2a1dvd1lLUWxzeVBDRWdkODRxbnhHbjNP?=
 =?utf-8?B?amJwMG5hZDQzNlVybjdiTDlxcFBML05BRE5JcEVzdWRqVzM2OHhuQT09?=
X-Exchange-RoutingPolicyChecked: XY9DF8ld0pTCHD3FrZrfTha+U9efBxAT4lUsUkkyuklO+QbZ8n87COqYR1I1BN0yEDiDvqxM3u84CO/EVVM4/1H9ZZkxEHmladJC6cJaH58FP8+6PV2+ZOcDcHfF/A1tFLVWJYJbnhdG2J7MX08ebGs2ncUS3W5URsCHSoqbWV3on6d4FQLZuRIL5LyOf6iSkleNORvkRtssL3EP4xQGnZakRxV8A3PXBY3/sU/cam7qj6paV6o7WfhFIfrUEo1i6gELp4YApuPWU7arLB9HWXxSEPcVw+aY5e2C2CwRsQdqNqL1FCC8N7pbisQQbohNwb2XEdf8RRSRENtTejMYBg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 25c776ba-a0d3-4e5f-8cb1-08df2b473eb2
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 05:35:10.9811 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PBLuED+I1tUNIqDXaJrEncSTcZpFg869+/MpXswpmcFnaXLTOfQ6mOuMJ1po2dNfUha8ldc+cm+ZOz4JFD7R2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7023
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


On 14-10-2026 19:24, Kamil Konieczny wrote:
> Hi Mallesh,
> On 2026-10-14 at 17:20:47 +0530, Mallesh Koujalagi wrote:
>> Wedge tests intentionally force a GT reset failure, which can trigger
>> a CORE_COMPUTE hardware error (SIGID=203) in dmesg.
>>
>> Ignore this expected error so igt_runner does not treat it as a test
>> failure.
>>
> Add cc before your s-o-b, also add few more devs found by git blame,
> so also +cc
>
> Nishit Sharma <nishit.sharma@intel.com>
> Shuicheng Lin <shuicheng.lin@intel.com>
>
>> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>> Cc: Riana Tauro <riana.tauro@intel.com>
>> ---
>>   tests/intel/xe_wedged.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/tests/intel/xe_wedged.c b/tests/intel/xe_wedged.c
>> index 4f5197e2a..fe8ea6969 100644
>> --- a/tests/intel/xe_wedged.c
>> +++ b/tests/intel/xe_wedged.c
>> @@ -54,7 +54,8 @@ static void ignore_wedged_in_dmesg(void)
>>   				    "|EngineClass: [0-9]+ [a-z]+"
>>   				    "|EngineInstance: [0-9]+"
>>   				    "|Tile[0-9]+: GT[0-9A-Fa-f]*: Fault response: Unsuccessful -EINVAL"
>> -				    "|Tile[0-9]+: GT[0-9A-Fa-f]*: Engine memory CAT error");
>> +				    "|Tile[0-9]+: GT[0-9A-Fa-f]*: Engine memory CAT error"
>> +				    "|SIGID=203");
> LGTM
> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>


We have to ignore this string as well

*ERROR* Tile0: GT0: GuC: Uncorrectable local error!

Thanks
Riana

>
> Regards,
> Kamil
>
>>   }
>>   
>>   static void force_wedged(int fd)
>> -- 
>> 2.48.1
>>
