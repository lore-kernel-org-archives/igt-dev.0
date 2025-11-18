Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 547F3CEE32A
	for <igt-dev@archiver.kernel.org>; Tue, 18 Nov 2025 15:50:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA0F910E4E8;
	Tue, 18 Nov 2025 15:50:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dXV7Sjt7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACDDC10E4E8
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Nov 2025 15:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763481038; x=1795017038;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=csWBdEBJciZwKwwG144JpmE9OzDAbdPc0P/uMYIGoSc=;
 b=dXV7Sjt7jJPrRHlL9CZ8Wil1FrtRfTvplYlYL8zUcVPnh+/Q1VtY/Qiz
 eLEv9mMWfAORWOFYMQL0awjdU8GwyYQ8VZz36P0qZzGc8fmsUAQ6OEZFL
 Fr5OqSZ017Yi0kbRO6yldtQOG9OQu3XeSiMqGzbDujzf8NOIH41oepWjE
 CL8DmzPvSwWRlVLV8dchn6D4CKas/UClzk59uPyLEeysx9NpX3X4xCcgJ
 LPX+zGtn2lOuw+gSYUBSlxRjgiEEE77hR7MCs8b7xlQheSydhRwGKiOmZ
 2JR+YbCtrZMpLrXj8L+UqwPd+LvgFij/ypgCAEA0oe4kIkLL8bFz+7bqT g==;
X-CSE-ConnectionGUID: sd8fEDSMQ+2n0PNBt8xkvg==
X-CSE-MsgGUID: O2V6fdD/STqC+hN7DU62yA==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="65406268"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="65406268"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 07:50:36 -0800
X-CSE-ConnectionGUID: oXRm6w/zSjODEEgEbX9Fow==
X-CSE-MsgGUID: Rvj0NwzESeGtptwGK3DI7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="228127571"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 07:50:35 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 18 Nov 2025 07:50:35 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 18 Nov 2025 07:50:35 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.48) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 18 Nov 2025 07:50:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KkMrcH0pwuSHCBugv+WzFCxp2cDtwEdq2MPYA7NMCY51pvBHKONkF8M3aIMQ0JPElqPHeiFKcAAM9tfKeMA/NfWqBP2rna3ryMaKV5eC4QELTIvKUEDDcn0UXQ0wAHFFHA71459x0oNPOUc5u6Z9egn+vAIZdiBxbG3/06rB1CVG+nIHiDr5nykDAF9DG5oV1gOHldJ/EMHK8ix2X9rBCJ6zyxQhVMsBsEfcloXv+NxhWGfGHkTsXM4ZxHUcsNeauAu5swBa1fCZFdb9LxtwRlpKzVJvA5/Hbt1APMVXH0fwIy5MTf2qJDZRH9b3M9307RUtb5sp21uYAWthFgSaJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hzu//VSg1jJvBgi4z31HZKawgBxe4eiiz20phEoAOaU=;
 b=so6DJAPcRmQ0tdwhcUd2AF2g1X8NAFGCaCS0W7gTjLD/7yGPVaTVxM7sAvVgqBIR8OoyijhTc4vhmp0R1oOOpPJqqSnNFwSW4OxHVtiujVUrl/YFOTHbBQY86SLv3bLTJeF7lds1AxpcGqcKN5ASgybA0XdhpEzkJmd5c43Y1v3rDrW4xVLfu6GvoXkL4+N3vSGPWZfBom3u6et8q5KUjIsCB3RErhelsozu+IKynLqJaxZ37IsNUNe/9iDM+CP+O9cUgorPXhnkp3P6uDgEFFB8lDtKQEyDF8h28uUo4nki9n3sPaivXFus2HrxSOrv6c0MNmmEBuDdCeImJjNqpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
 by LV3PR11MB8556.namprd11.prod.outlook.com (2603:10b6:408:1b4::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Tue, 18 Nov
 2025 15:50:32 +0000
Received: from CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc]) by CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc%3]) with mapi id 15.20.9320.021; Tue, 18 Nov 2025
 15:50:32 +0000
Date: Tue, 18 Nov 2025 15:50:19 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: S Sebinraj <s.sebinraj@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <jeevaka.badrappan@intel.com>,
 <zbigniew.kempczynski@intel.com>, <kamil.konieczny@intel.com>
Subject: Re: [PATCH i-g-t v3] RFC: tools/gputop: Add GPU frequencies to the
 client headers
Message-ID: <42itzms3hb3wvq224i6tmv6am7et624dx2w4lvqx6k6yex4snu@lq7ojx3jjphf>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20251118055043.660759-1-s.sebinraj@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20251118055043.660759-1-s.sebinraj@intel.com>
X-ClientProxiedBy: TL2P290CA0028.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:3::10) To CO1PR11MB5057.namprd11.prod.outlook.com
 (2603:10b6:303:6c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5057:EE_|LV3PR11MB8556:EE_
X-MS-Office365-Filtering-Correlation-Id: 00d9b0a7-41bd-4110-b84a-08de26ba34af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RncwbTlaN0F6NXV5bWwrbDB2S2NUTFhNQXhncUZuS2pCcCtTZHBhMk9ZNXhn?=
 =?utf-8?B?Z3lNZWh0RTl3YzBVZGRCalFDNWZnKzc0ekR2UksxTzErdmE1M3YxdTdvQkhF?=
 =?utf-8?B?ck5wTVArTTZnekdxWmI2SkxuemVSVnBXdEdTOThadzhWbGVTVS9pSXIvOFJH?=
 =?utf-8?B?ZUk1b1VKSmVYQVdld2NEaWdtd0gycE9zZnRhbmF0QUhLb3ZpL2dvdFNySVh5?=
 =?utf-8?B?L1kwTU01M2tnbEVQK1ZWSzFpRm1xTUZaYlQ1eWVudDBDVjc3WDZyY3l0K3U0?=
 =?utf-8?B?MEFMb3FrcE9EbFpxZDJrQXEzSCt0Z2VKWkVVM3JaRS9ZZTVJeWlTTE1HZEdw?=
 =?utf-8?B?eDFhNDZGbGJnVTZENW1RbzVXNDBhUTdPaFNvZyt4NjZ2T2JPNVA3K2pnWDB2?=
 =?utf-8?B?ZGl3YnFNbVVYWmEvU0JqVEllY3ByWVJ3ZDJ3N2FpREd5N2hPV3RZQUlvNzZQ?=
 =?utf-8?B?SkY4WmlhSzQ2Rk5MTjE3WXhXSWNKeUQ4Rm9pNXd4UDlOWjh4SDdHUkhnSmkz?=
 =?utf-8?B?VmZMYmloK0ZMSnJKdlZVSnhKL2NMclVoZGp6aElPcTkzYUlKR0dCTzRFWEVT?=
 =?utf-8?B?WEdETHlmVTR0QmJhSzQ1elhSR00zTUlTYmRENVJ0ZGtjKzR3NVh2Y2szdlBt?=
 =?utf-8?B?eW8zQTVNZDlIYS9DZHBJZEpJeFVqOVZKdk1uMGwzRlpDZWVoVEU1UTY4R084?=
 =?utf-8?B?RGVpT1lhcVM5RTRBY3NzQjMydlNCWmtXUFZmaGRlRGVVazczeURGL3JtS2tX?=
 =?utf-8?B?bkVqNW5aNFZCRHFmM0lDUFVhTUNBZWpKU3JpYzFHa2lCamJiZUY5enZEUXpC?=
 =?utf-8?B?anZUVWpSYk1JMEkrWHRkajFUazJra20zUW9aVmJ1N2F2Z1FMY3MwWXhsODVo?=
 =?utf-8?B?N0prVU1BVnR6YkNoTW84NzRNWXY1TUkreXB5OU4xMWtCU0hiekJYbnVOelo5?=
 =?utf-8?B?ZWdnYzR5cFFBS2lOQUV5OVJMWnpiV0Z1cHkrZDZiZzAvYlRQWXlvUjNkVnFG?=
 =?utf-8?B?SVo0SGwveDAzRWZ3UzYrYlpsZXJpdE0xMlFwVkNjQmdvTjlCazZaRFNzQmFx?=
 =?utf-8?B?bzI4djRWc00veGtzeVB1VlpsVkwzcWlzOFY3U1dsY2Y3djhtVm9UT1FFSUJW?=
 =?utf-8?B?Sy83VUZXeWJSN04xWUhnMGpPUVZaVWdhS1hCZmhyK1BXeHNjMVNDS1FsM3Qv?=
 =?utf-8?B?bDI3N0hNV2dhaW9pOWxRVkdJcERVcVVTbENjTTJaSHZ3Y1p0TVFtQWhEVEpM?=
 =?utf-8?B?eUhxQ1NVeGI3b2YrK05HZmk3RHYxL2RVd3p5R3I2ODhicldnSUdSb2FFazh1?=
 =?utf-8?B?RXdxelV1Y0pVeHMyRFpyUnBoUmVtbEs4Mm0wUEtXamtBbWRwd2lUeTJaSlF0?=
 =?utf-8?B?aTB6VWw1dFZCWnNHRWFTUWJuV1QvejRhVHdDb3NZVkRNUnpWQkN1Rm90ZFpU?=
 =?utf-8?B?MFRtaE5mVk1DelhhYlkyR0QxbW50QXNRMzdwcXJrVFNuclVsU0hCQlNPaHpl?=
 =?utf-8?B?ZkRRemZRdDNpckZwNnF3U1hmWGs1YXA4STBoMWpTQXpXSzNxbnVaSlBmTFFQ?=
 =?utf-8?B?N0E1dkhwYnRXeElMMWZvZ2kxVVVLRVBOVzdwM2d1SmM3ZHNzdUdqenN2ZEJE?=
 =?utf-8?B?TDdRZmJ1eXRiVFgwRXZNRHkyNFpPd1VhL1JnRk5taG1hVUd1di8zeFN4OGUy?=
 =?utf-8?B?Y0RXc2J3STNoYTdTWmRISVAzVzBJTzNxelp3Y3IyRFhYdWk4S2xSVUhGMUp3?=
 =?utf-8?B?Y3JMZEZXMTRxWEttSWlhRkp6K0swOTAwM3hLTHVmakw3Q2RGenBaTFFXQ1Ja?=
 =?utf-8?B?RmkveEVVQk0yMW1tL1JTajkwd0t0UFhXZElITFJHRUtCak1vWGQwMFM4amll?=
 =?utf-8?B?RjgrTFFsQWwrNkFLVUhRWWtleVRJdFFyeDFqTG1lSTBnUlh1WElUTkFCRldo?=
 =?utf-8?Q?8xx/CG3ER+V5vNRZPN6fsZnON5oGGkT7?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5057.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OTVwQjhRUTRvbUlSbzZTbzhYT2RlRGdMQmF2c1VURVBXemdKM0JPYnZoN1dy?=
 =?utf-8?B?WlM3eXBmVTBKeXdGOGxJNjlnQnlwN3JTT0Y1YjRMUTE5c1ppQkVyYlVzMlJ2?=
 =?utf-8?B?ZjViV0w2enJ4TndZejdqSXRYK3hDMlNwdXAzTks0UkYyelF3MDZtT08vRExx?=
 =?utf-8?B?QmxsY3puVkxqWndaYnVtN0lCMzFlYTlDUGtnUjdhVjFCMTcvNE16RFRnbDJ0?=
 =?utf-8?B?c0FmZE9GUHBLakhWM1FLTDVqSzhod2txRXpvNmRTdDZhN0drcHpyNnExcEoy?=
 =?utf-8?B?TDdSSWJxazkzeDRobm5aV3BqeXVrNEpib1BndXBiRjNoVnZsRlBycVkrMEN3?=
 =?utf-8?B?QnZ5d2JleE4yZzdHNVNNZjAzMngrVncxMHU0K1NjZHNrM0VKeUdNSm9GRTFJ?=
 =?utf-8?B?aWhOU0NQZ1ZlYTNkUFM2VnVteWZ0d0t6N0FtbzVHcE8zZ3BOQ3Q5bUQ5RzEx?=
 =?utf-8?B?MnM0aUFrOW0xQlhJQXJ0T0FIc3pRNmJMRzhPU24xd1M4dGRzRGpNOExnNGhn?=
 =?utf-8?B?SU1FamtZK3R5Wlh0Q2lSRmRDbVYzTWRiNEtyc0lBaXBtU0tVcFpNSVpvY3RT?=
 =?utf-8?B?VG5PKzE2QTNOMjRUQUVwQnE4TXl5MzNPR1Q5ZWpleWVteFhmVUhKeUczMEdJ?=
 =?utf-8?B?eWhZWkRJUmlWaFRUWFJwVHYvT3FvZmVCUzM2NG83dndQVFB4WklWOTdyRlBQ?=
 =?utf-8?B?eWVGU0hzRDNLMCsxUkxIOTgwQURabjlmYlFxdy8va2lONmV6THhaMEsxQUZB?=
 =?utf-8?B?WHcwbFRSYjViYlhYTk5IdW1SRUF3QS9ReEpOK3lkRk15c0FaMmdTdTZ0R3Zr?=
 =?utf-8?B?QVhzSEFEZ0tOVjY4b1FhQXVTZWkzaHB0Y3hiYmgzaDl6azV4SUFxYWRvV0M0?=
 =?utf-8?B?NHdQUU96RzJXYjczNEtNUTRrZTMvSE53SHN1c2FjMGcydDM0M0xNM3MwWmpl?=
 =?utf-8?B?ZkJ3SGJoaWxNZTIzandHaE1uN1pBZVRxakJiQWVyT0lOMFpLaGFuZkFHWjBM?=
 =?utf-8?B?S2hJN1BIazczTHdObllkaUJBVWcxdVgyZktvaVdGdEtlMWlQR0hBaWhCRHY2?=
 =?utf-8?B?dGU0MzVOZDROQnp5QVArRDRYT0F2QmovMDYvRHRzNVVPYjBLak0rWDNZbERG?=
 =?utf-8?B?a2pxSnBGNWlhbmZMODlZZVl5RVVCZ29ySFFOY1VlNUFkVmlOZW5YbmpnOGsr?=
 =?utf-8?B?RFkwdXVoV1FaZlJlQjhjNnNwRWtZSkdvbEVhcmUvcjI1YTdQNGZXZFJ2YVVX?=
 =?utf-8?B?S29RNFZ1WnNaUm1PM2tyZWpWNFRwZ0FJdTRYWGlySCtLdDZWMDZMMnhVVzEw?=
 =?utf-8?B?N0psWHQyb201MWg1MkVaZGJYR1JobkliSU5CUWZzTmF3WFNHcStvd1VOVnFJ?=
 =?utf-8?B?NWVweHduS1ZoMFRHeXhnekhvVTR6QWZKT01CY3Bnb0x1dEJwc3psK0ZJVllY?=
 =?utf-8?B?MHNVMm01ODZncHJJN011OUpPaXUxVmdsRVVmUDhheDBKbjkyK0NOTVZJM0xj?=
 =?utf-8?B?d3dRYWpRYkphZmFwRTc5UHREaE94TjVKeU5kMWVwclkzT01rbVJZQU83T01j?=
 =?utf-8?B?RHFDbXZ1Y3BRR0N2S2t2ZU1FM0VIT2JmSFROSDJ5YXdzUk1rL3AzRFlKdUhV?=
 =?utf-8?B?ODM5SnEycmVTTlJEWmhMTHNFMEpCdmVBOE43Q2ZqTGp1YkV1SUhPRWc2S3ds?=
 =?utf-8?B?WmdtdzVBOFFEUDN6TmY0RDBXRjIwU2NPRHhJUCt6YTQ5aXI5Q0YwMFM1d2Ey?=
 =?utf-8?B?TTlXVzg5Rml4a0xPK1JJRXd4SzEvc29oYUJCOXRwTzRYME1HR2p4U3VjWWJ5?=
 =?utf-8?B?QUM5SUhyVTRiL3AxaHlCZkp1LytZMWEzMjhDR3ZpeE83akRMTUdBREx0SWhE?=
 =?utf-8?B?Zk1qakNCM3hySngwUGVFSWxXU3Z0T0trM1NUTkZRTisxaGs0MFFsSkhNTjN1?=
 =?utf-8?B?RW13TUZaUUx0WW5oZ2grWkxqMWx4bTRMOHZhRkVSYVBZdFI3dko0TTd5RE5h?=
 =?utf-8?B?Y1czSHRaMDBtc1ZZWTVUY2FNS3J3cUlwL2NuV0hHaDBEbVYzVEtnd01wNEZP?=
 =?utf-8?B?RW11aTR0RGVnQ202K05zUDRibEdBMkRIdW96OGpXVjZUMmlERWtpeXg0bGh1?=
 =?utf-8?B?L2t3OFM3NEZSTGx6aHlHb3gxclpid3ZvY1V1dkowU2xvNTdYL2tZOUdvSEMw?=
 =?utf-8?B?OVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 00d9b0a7-41bd-4110-b84a-08de26ba34af
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5057.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 15:50:32.4623 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3/m3EnfE1vqjrusF2wQuBL1QHIJYfwiPJJe73/yOziTSm/LxPau5/W6GOai1fcA14Z+2x2wgfr6aes3oras2lEsgGTKJE8VR1RhM10qN2fo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8556
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

Hi,

> Enhance gputop to display GPU frequency information (current/actual)
> for each GT in the client header line alongside the DRM minor number.
> 
> Key changes:
> - Add get_gt_frequencies() function to read GT frequency values
> - Support both i915 and Xe drivers using appropriate sysfs paths
> - Display format: "DRM minor X  Freq(cur/act) GT0-freq/freq GT1-freq/freq"
> - Use IGT API functions (xe_sysfs_gt_path, igt_sysfs_gt_path) for
>   driver-agnostic sysfs access
> 
> The frequency information helps users monitor GPU performance states
> in real-time while observing client workload utilization.
> 
> Example output:
>   DRM minor 0          Freq(cur/act) GT0-1800/1800 GT1-400/400
>   DRM minor 128        Freq(cur/act) GT0-400/400 GT1-400/400
> 
> Signed-off-by: S Sebinraj <s.sebinraj@intel.com>
> ---

Thanks for applying my suggestions. I tested this while running
some workloads via IGT tests and it seems all the values are
displayed correctly.

Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>

-- 
Best Regards,
Krzysztof
