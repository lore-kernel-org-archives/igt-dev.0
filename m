Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56FC8E7314E
	for <igt-dev@archiver.kernel.org>; Mon,  2 Feb 2026 09:37:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08C9410E3C9;
	Mon,  2 Feb 2026 09:37:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KVzpD+N8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E6E510E3C9
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Feb 2026 09:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770025030; x=1801561030;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=mALZKfeUBfpkz5bu1OizLdEpnCZNDZAwIkFsr2rKoeY=;
 b=KVzpD+N8N5vp3xdJj+55ISzMENky/trq5AWkSr653noDTyoA/dvn0ty/
 ZSVf0R78SXPS+aXTd0Snaj6TlAmKdXiuI6az2Q9LdS2h4+keBNBRBGGH5
 jKPJHYZcMlJ+VIWJkkqjGsDV+r27drFvv6FyUvf3D2Eoyvz4/LTqdLyQD
 79tqL46LkgV8SJRiVcuoa35CuxJD+Snke47Gxkb+KCFU2vOs+74vQ3FVw
 3GH4bItV9/yzx4GYDDBmjFuWeX7DYSZfvOficCLwfxI4sYQKzjdTLk2Lc
 jf5QFH5YmfTjvooRGj7WGRqJydw2lqcQXX79xtVUnbFlJRjvPnU6LIMJB g==;
X-CSE-ConnectionGUID: JNK+CGNaQgqUip6FlneV7w==
X-CSE-MsgGUID: dhjWKxPjRCGl7r7CKAF3UQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11689"; a="75037014"
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; d="scan'208";a="75037014"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 01:37:10 -0800
X-CSE-ConnectionGUID: t4XPOTkqT+itc+KRJnSRLA==
X-CSE-MsgGUID: m9YiS+lFT7CgSona8f15Cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; d="scan'208";a="214303018"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 01:37:10 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 2 Feb 2026 01:37:09 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 2 Feb 2026 01:37:09 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.46) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 2 Feb 2026 01:37:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JxXFkH1A/0vUz7a5OaA3wasa7Gp1J8T70Vt2IA+H5pu3rqARTykgwm+zUPRtx9g3Xy8yplcjq9mDhteXY/uocLw9xaLoUyFAUmJALl8GS+0B8QFlN+gLMJsrmOi7MHSFCErHgSGX2LBZnDSsCxZ63/JRfB3awzHuaEvO7jJWG4D/3nPr+x7F+muqkpBufQBlstXKyax3/Z59CYj4yQClOG9HlXLSCMHkCvo5qG3Qo3MxUOtFNeYpbxvyDrW7DwH37ai+7Ur3RaIybv/N7fWj9E/EPvhRVyijXV9st2aDOFfuUsrQBZm4WlTXjlBQ7Q80n1GJq+vc1zObv4H85mzGRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KEZyO66pr5pyx9tqx2Prz5dq0//6+bJLXtqLTyIeGCk=;
 b=rwOa7G+nGaPtVXJ0t5yDAl837CXOTt83jxprrAOpJIiKTuIO3x8sQrXu3Ek20zl2E2el1upxyV1bilD7ACWROElScLETRFQ8mSeatF2vkqJBdWuTBw6aZzrzwt45WD7Gai5Hynsyuaz/x2JpDmDzay1oS/FLtFd7nfYA+UAJB+Wrv8l044Ydu/GX5lKF4NrrJdsiVraIKF9kLZ+hxKamxXNPesPqerb+dYanoo3pfdyc9kEK1g7SKax2MLzMDfW5iZ56pkJjImSX0GODReTcx/Acm5u3zXRSxMDG/G79eUoM7RqWw1gcWCuInCjc9bxfrEIsXLWizt5rqI63VWnY0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5249.namprd11.prod.outlook.com (2603:10b6:610:e0::17)
 by DS4PPF11E6CAE14.namprd11.prod.outlook.com (2603:10b6:f:fc02::c)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.8; Mon, 2 Feb
 2026 09:37:07 +0000
Received: from CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3]) by CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3%3]) with mapi id 15.20.9564.006; Mon, 2 Feb 2026
 09:37:07 +0000
Message-ID: <014be4d9-ab8c-4c3a-9585-26e2ed378314@intel.com>
Date: Mon, 2 Feb 2026 15:07:02 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3] tests/intel/hwmon: Check temperature limit in
 hwmon-read
To: Riana Tauro <riana.tauro@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <raag.jadav@intel.com>, <mallesh.koujalagi@intel.com>
References: <20260130103553.1935825-1-karthik.poosa@intel.com>
 <a902e00d-fef9-4147-8166-1cda4e079c71@intel.com>
Content-Language: en-US
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <a902e00d-fef9-4147-8166-1cda4e079c71@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0026.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:17a::9) To CH0PR11MB5249.namprd11.prod.outlook.com
 (2603:10b6:610:e0::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5249:EE_|DS4PPF11E6CAE14:EE_
X-MS-Office365-Filtering-Correlation-Id: 8cf75b14-d233-4f8a-41cc-08de623ea180
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dGoreVRxWDYvbk80OE1LQVk2U1Q3L1BRSkNhRTFsU3gvL2tEdjVrQVJtMjJH?=
 =?utf-8?B?REZlZ3VpYXNoSXNlRTFEWHhiRU4xV09XWHBxQ0ZTS3pUaWtkVTNOZXV2Q2hH?=
 =?utf-8?B?c3dsUEJOVzBMM05EVHBzUUp4cG9WMnYvcS8wamxqSm1HMGRJUG5vdXIvV21D?=
 =?utf-8?B?YkYzazdxM2NTcWNUdENNZ3ZySW9PMWxkMDhYTURQNzlsdkswZ3hvWkxScnM3?=
 =?utf-8?B?cFZoN2hFY1A4dkZZWEdhbFJQOXJhR3NmK05jNnJmemt1ZHU3eWtQNk82MzlE?=
 =?utf-8?B?OUNqbkJHMnd1ZUhhRmVDd1ZtckpCVXZtUkpOSzZhRDBNcjh5R0xxVVI5WXg4?=
 =?utf-8?B?WlAxSXBRODhlSFR3UHRzY1hpM2IvTkJrNUlFSjg4Z253dWVzNEN5bnFDdTJD?=
 =?utf-8?B?bnVmSmk2NVBBZy80WGtTQVhTV05DTktTamt4Vi9JWGI3YVNqcmx0VTBRS0ZY?=
 =?utf-8?B?dnpZbXNZMnlYUFVaVUN6cTFFWGg1cG1IVkF4OU1RRWdoem5oTU5Bd1RqTVAz?=
 =?utf-8?B?bS81Z25jbjBaa1VEWWpNQ1BuMUMyVG1wUEtoa2ErVkQzelNpdGFSSzMxN2tm?=
 =?utf-8?B?Tjg3U2kwc21lNm5MbFgxQzhEenBYZUtNdWZxdnNlK1J2OVU2RWp2VTYvQ002?=
 =?utf-8?B?UDJRbC9OTEt2b212ZVRiS0QyTmVIelVOQ1VKdkF5S3craVNFM0x5cXo1WGE5?=
 =?utf-8?B?RFZlSHRZelJSNFd6YTB6aVVmZy9UclVXZ1JzU0h3d2FLL2E4RnJoVzZCYmNQ?=
 =?utf-8?B?STRiVVUrMTl2V0ZMSXFWeVNYNE9MdEl1QjNJcWJtLzhTZi9DcjBNZGFINTZP?=
 =?utf-8?B?S1JOWVIwUjdycURmLy9YcWlvU1NqL2N1S3BTQkhVWnpVci9FMzh2RUpLTXJC?=
 =?utf-8?B?UndjMjdFK2lHZW9jcDRGbmJKVm5QcWxqNXhpQjNuNXBXZXQ5NVlDY1VqbnFX?=
 =?utf-8?B?VlFMczJSLytDc2pjMzZkRkdEODh0U2dBZlFvcUlvczdGbTRxSVZnaHVQd1M3?=
 =?utf-8?B?WDhRblJkM1dKcVQwbnpvbUdWc0wyaHJTTHNIM2p6RXhYaFN4TzJ2ZWhOKzB0?=
 =?utf-8?B?RURSQXNoL2oxS3BlZ3ZrQ09YbEJFM0liZWRYc1ZsTE1CU0JwNGFHSGFHUUln?=
 =?utf-8?B?RmRoQ2wwNkpyV2NoSy9EaXZneHVQVFVLSU5ON2N4NVRHQXVLaCtFRzI2Uk51?=
 =?utf-8?B?MGJRQVNsbHBqTGxPc2YzNVVyaEZ5TDVOUnR4MnBGM1p5L1JTd3MzdHgxa3lk?=
 =?utf-8?B?Z2pKRnluYzJ3VUNhczN1aHUvQm9hQ1ZwQ3ZZUjl2aGtWcHFyUTVvOUZBbFBJ?=
 =?utf-8?B?S2R1MWFuR21vaEVETm9TQStNNXZkZHFvS3NoTytxM2pya21lMWN5WXBMdWNG?=
 =?utf-8?B?NnhKZFBUUFhiQXJlOFVrOGpZaEFjK3VRaWRLSDVPRDVwYjNHWEN1b3l6QWJx?=
 =?utf-8?B?bnpsOFJON3lWWHZuVkpRNmZkcmhYRXNsaXlsNi9KWFNxTGE0MFJDVVlDTnhI?=
 =?utf-8?B?dEFPRld4WHlDc0o2N0V5alRPYnFqb2QwQWF3NXZzQTNNOUtSeGZQMkpXUXBL?=
 =?utf-8?B?YU1Sa3NYTTF1Mkk1MHhhRU5yTGYvK2VNS3ZtQTV0alhlRE80UEZLWGNOdjV6?=
 =?utf-8?B?bVJTYVM5bFIxWSsyMWdPR2c0QzZHUjErL1BDSGZtcnhKdnZTNEFjVWxiMGJ6?=
 =?utf-8?B?bUR6cXhwdU5RZisyQXNxbmIzeitZS242QmZOZUJEUTJuekJ1Vzc2blljSjhw?=
 =?utf-8?B?ZTkxOVE4Ui83dUtCTkRiSGg3WUk1bzlTWDlUVWoxRTlZVXJkaU1tY3IwTC9C?=
 =?utf-8?B?WWxENHFKdDZVaVlDYlhaanNXVXpaZjdQZHIzc3MvN20wNWE2NjBGclc0dlA1?=
 =?utf-8?B?bUEzRkN6QllrQjlsaHNHMVdSM2JoSjBWS005OWhTMlN3aUxDcVNVYjVzRUZP?=
 =?utf-8?B?ZnIzMnhBMU5LQlVlSm9QdFRNTlh5d2ZTK3hkWENYOHdNNzQ4RFhVT3lZSXhi?=
 =?utf-8?B?elpLQlpRQlAvS3JOVjVIVzhsMjZ3UkIxcFp1NUpFbngrSzhJcnRmSVFCNkNi?=
 =?utf-8?B?RHA2clJFVXBlYlgvY0FheGxLeXlvZ3hqZnBkWXAwbGVzeWEvOC9POVZLMDhV?=
 =?utf-8?Q?3Wi0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5249.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UlZmdHJZQy9HdVJQVThRUWdLK2ZUMmVZZmJkTk9HRDFXblR5akVFbEhYYWto?=
 =?utf-8?B?WVIxZWVmMjk4czR2MzRwRXhZdlJNOWFTMUorSnJJNmY0Vml4R1I2bk5DTzVJ?=
 =?utf-8?B?a1Z4RFE3bGFaKzF2U0F0ZjhjZmFEbGJXSWRGbE9BU3g5TzF2T0pPWnVROHdX?=
 =?utf-8?B?aHBZbjR1NXhyNDNWRUlJVk9JOStXRGNhTk4rc212aFFTeWgwWG16N0R4SGpY?=
 =?utf-8?B?ZUVUeU1ieEJadFVXcTNteUJSQlVhbkIvUkhQV2xZdUhqN1JTUTRxdGFla21G?=
 =?utf-8?B?T2h2cGF1Y3JIVXVRTWhIVC9yT2pxS3k2MldQOWpGNXBGSlB5Q3FuVlJxYnlB?=
 =?utf-8?B?dlpYRW1KRjNKOHZqSWRVWGVMRG9OR29xYVpKTzJwRldjSmwvUnhEMVJBZUVG?=
 =?utf-8?B?LzdHR3FFeTM3ZldZSWR5OEJwQWQxbjBzbzFDWjdESkdyQVgrNDkxVkp5TGFv?=
 =?utf-8?B?NW85ak5FYWJZTmFSN014TS9YL3Z1MDFCbVhHNm1JYjNSZXVvSUFXeVZkRjd6?=
 =?utf-8?B?dzFCRUo2cS8wV2FzMWN5K2JjUUtmTnFBNlJqTWdEQ3BjdXdlVWNGMGhwQnNN?=
 =?utf-8?B?L3g0dStzaGxZVGFrYU56Z3dsYXlpc3E2b2s0Q0Npc2ZDQTJGWXRpdzhUTXF2?=
 =?utf-8?B?SkRjQ3FMYnY3Q0d1YXRON1VJL25keDJmc2lNb3BJUmE3UDBhN0MwSTBFK1ZS?=
 =?utf-8?B?ajluUFgyTVk2U1FKamZueitUWm1rZmNqU0c1cjRIMFF0MTdWMjAwLzlOMFZn?=
 =?utf-8?B?d05nRkhxVmx0a004ZWFHWnNZQWx6K2lPKzJpZ0VJdFd1dEErRTFRa1BHcWJS?=
 =?utf-8?B?VmhhNEVCMWI1Rjc4b2VTWGxSdkNFUmtJYzBvTFJaUHp4N3hpUXNuZXNuQnBK?=
 =?utf-8?B?S0crbGdwbXM5cCs3ZkM5TkF6VXJ5QTRaZFE0cUlLdTVBaXYxLytDRHZZNXBS?=
 =?utf-8?B?cVlNOWorRUp4OEhoaVREcWpZN3FKWXE3NEttY24yU1l4bU1QRm9kUzMrWGsz?=
 =?utf-8?B?SmdZT0tlOU9tbWw0RmxSTitWWWY4WEFmVG1QN3V1d2NJZXpEQThRaHQyVjdn?=
 =?utf-8?B?NU1MUXJGVmhlNHdPRlh3NnN0QUZpUzMrV3VoSkZJMmp1RGErMVlIN2diM05V?=
 =?utf-8?B?cXRqYWVhOU44T3lxUmsxZlp4Q21PeHpZQ2duRVp5cDhUa3BvdTZlTW0zaDRE?=
 =?utf-8?B?NXAvc0dhOFB5WjhwYXk3bnU2RHE5YzA3UktsV2x3NnpRdXNYa3QxNDlVSmNR?=
 =?utf-8?B?eTZpSlRPMlE2QkpwbzYrZ0xCNmtpU1VBam9NN1ZYY20yNEZaQlo1eThLbFda?=
 =?utf-8?B?MnV1bjVsSFRmSHM0bVBsNU1PT21YU3hNeHI3VThmUzVYZml2ZDBuc1hha1ZC?=
 =?utf-8?B?bTlUZTB0c2hST2ZRWDZDbTAwbkhIUXkwd1luZFc0U0Y5WnY0VjA1RXk2ZGRP?=
 =?utf-8?B?RWxxd2pkUFBqOFJtZG5BT3Rxa1QycGNnMVVvTlNha2dVL2pLYVlJd2ZzQnkz?=
 =?utf-8?B?eXFETHlMMm9lSlBFby9hbEpFc3VLejVhaUk5TlFFbXRYbmVuOWMxajg5aUQ3?=
 =?utf-8?B?SmVITkFQeGh5L3l2MG5neCtpOWdyY3V5ZGtpMTlNZ0MzcjJiL2I5amtMVnEr?=
 =?utf-8?B?cVA0V3laSWI0OEZVbEZIZUJaYi9pUjNxTC9STDFEUnRka0t4QlV3TXRSSnRY?=
 =?utf-8?B?S1NNOU1OYTlZR2dZVkRaTkxpelB6V0NUSXNRdk9CdEdGeTQzRGQrWHhYemh1?=
 =?utf-8?B?K2NRMlRVWGVQNzRGcmhWSnJpSVpKQXcweU5pYVdndVJoS0J1SzRPTUhtQkoy?=
 =?utf-8?B?Tkp3cDYvY0lVcHBWTlRMUXJqUHd1VGQrLzM1ZzE5NjV1U3lLVEcxYjFpZ3ZL?=
 =?utf-8?B?Rk45cjNnTk9rdzNmbVZYZ3pIcDBRYndQeXdLNmU1VTc5ditQdUE3MGFodldW?=
 =?utf-8?B?K3o4Q2hPVytvY2V6UVBkanFiUDVmeDFwcGlVVDFDYWE1czhMQ29WTTRoZXNV?=
 =?utf-8?B?WmlXUHZLUGJrMVdzUFdHU3hhQkNUbnB6bE5aZmRsNTZlTm9GVUc5Skw2REUz?=
 =?utf-8?B?L2hnMm1hZ01BVncxWGpsUTQvY24rNk5MRElJVUVmOFNPSDQ4SXIxWVZkWG5s?=
 =?utf-8?B?c2ZNR3NybXZwakVocWdVcHVBSCtqQWdaWW5aT3BCcmFEd3lZL1BYKzk5TlJh?=
 =?utf-8?B?U0RCSFVQZm1QejUyRk1GVXJ1aGN3L2x6M1ZsZ09yaTBPZE9WUXFuM1RCcndJ?=
 =?utf-8?B?U25HaTJNM2tGQTYyN3JoUkh3MUR6TmlXdmt0Y1NDcnhXZC9ZTTlPUmFGeS8v?=
 =?utf-8?B?eEdacThoMXNRdnFyNzZsWEpTV3Y1enBXWUcwU1N1WE9JdjJnUDVIQT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cf75b14-d233-4f8a-41cc-08de623ea180
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5249.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 09:37:07.3777 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3lumtA8kUBmh3WXYwbEtbSh9uDi21wqjunpORK9ElqbYJMNOdKamQkry5tnMRRn2nrj4mQdCssElK0Ph3p2RVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF11E6CAE14
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


On 02-02-2026 13:28, Riana Tauro wrote:
> Hi Karthik
>
> On 1/30/2026 4:05 PM, Karthik Poosa wrote:
>> Improve hwmon-read test to check if current temperature
>> is above critical temperature limit in hwmon-read test.
>> This will help identify any thermal issues with the
>> setups during test runs.
>>
>> v2:
>>   - Address review comments. (Mallesh)
>>   - Call check_if_temp_valid() only for temperature hwmon entries.
>>
>> v3:
>>   - Correct the API name check_if_temp_valid() referenced
>>     in the v2 commit message. (Mallesh)
>>   - Use int32_t for temperature values in check_if_temp_valid().
>>
>> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
>> ---
>>   tests/intel/intel_hwmon.c | 24 ++++++++++++++++++++++++
>>   1 file changed, 24 insertions(+)
>>
>> diff --git a/tests/intel/intel_hwmon.c b/tests/intel/intel_hwmon.c
>> index 103ae69cd..f185c1ca3 100644
>> --- a/tests/intel/intel_hwmon.c
>> +++ b/tests/intel/intel_hwmon.c
>> @@ -26,6 +26,27 @@
>>     IGT_TEST_DESCRIPTION("Tests for intel hwmon");
>>   +static void check_if_temp_valid(int hwm, char *sysfs_name)
>> +{
>> +    int32_t cur_temp = 0, limit = 0;
>> +    char str[32] = {0};
>> +    uint8_t ch = 0;
>> +
>> +    /* Get the channel number and sysfs entry suffix. */
>> +    igt_assert(sscanf(sysfs_name, "temp%hhu_%s", &ch, str) == 2);
>
> Is this format specifier correct?
Yes
>
>> +
>> +    /* If entry is tempX_input, check if it exceeds tempX_crit. */
>> +    if (!strncmp("input", str, 5)) {
>> +        sprintf(str, "temp%hhu_crit", ch);
>
> snprintf?
sprintf won't cause overflow here, ch max value can be 255, in that case 
max string size would be temp255_crit i.e 12 bytes !
>
>> +        if (!faccessat(hwm, str, R_OK, 0)) {
>> +            igt_assert_lt(0, igt_sysfs_scanf(hwm, sysfs_name, "%d", 
>> &cur_temp));
>> +            igt_assert_lt(0, igt_sysfs_scanf(hwm, str, "%d", &limit));
>> +            igt_debug("current temp = %d limit = %d\n", cur_temp, 
>> limit);
>
> assert should print values. Do we need debug?
>
yes, kept debug log separate to know the values without assert, during 
manual runs.

igt_assert is will anyway print the values of igt_debug.

> Thanks
> Riana
>
>> +            igt_assert_f(cur_temp <= limit, "current temperature 
>> exceeds limit!\n");
>> +        }
>> +    }
>> +}
>> +
>>   static void hwmon_read(int hwm)
>>   {
>>       struct dirent *de;
>> @@ -43,6 +64,9 @@ static void hwmon_read(int hwm)
>>           igt_assert(igt_sysfs_scanf(hwm, de->d_name, "%127s", val) 
>> == 1);
>>           igt_debug("'%s': %s\n", de->d_name, val);
>>   +        if (!strncmp(de->d_name, "temp", 4))
>> +            check_if_temp_valid(hwm, de->d_name);
>> +
>>       }
>>       closedir(dir);
>>   }
>
