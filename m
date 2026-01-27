Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42489D2D8DF
	for <igt-dev@archiver.kernel.org>; Tue, 27 Jan 2026 09:55:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E207910E046;
	Tue, 27 Jan 2026 09:55:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Dluq/vEW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FAE410E046
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Jan 2026 09:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769507703; x=1801043703;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=UDaymIwhKA8hkMXwqk2NQktpNuB4mwscemVOk4hBbKY=;
 b=Dluq/vEW+vwo4eaQLwanD5mfnWx1r1lUplHX+CQKaqgzujUNr9FS4weH
 eDnZz2wyZj4CEYPTJVLfZPJlD0959cs6fzy3ypPt+EhxHChmVsKuLsEm/
 uTB3kctAUzceiTLIMGa9/3CnD4va7MM+ncMqfbdA9xsI1fsgkIBLODaQb
 a/BbcNCo5Rli6samJpbxLNnb2eDXqEsxK4AqgxpDpLJcMiKigrLqABrt+
 yxTIgcLfSoit4aY34IpeX2FHdPE4xUY+0sUulazb8nQz7ZqlbRw+W/uLF
 TILRGmuCiix4rYH2S/LvZ8l6hA4fVeTKrT9WQBv4bG5IUppKy28Eor1sX A==;
X-CSE-ConnectionGUID: JU5ARWEFR1298ZJQAmGk9w==
X-CSE-MsgGUID: PRLc1dsOSp+MEauBCXzaSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="81332192"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; d="scan'208";a="81332192"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 01:55:03 -0800
X-CSE-ConnectionGUID: N9jeHqZxTXGcWz26zeMXtA==
X-CSE-MsgGUID: EfsgZe7jQpahURAbxcrSrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; d="scan'208";a="212912099"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 01:55:02 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 27 Jan 2026 01:55:01 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 27 Jan 2026 01:55:01 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.70) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 27 Jan 2026 01:55:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lyq0Mu/eLnyYZi9+byQaw9+iJRAUkoAzxKGNx2uEpJftox7d5nV3emdA2TCUeYhaD7+IiAR93jBkXA9c3EMbzNHlauutdgR3Dw52uCNhIAtnjtfv/7Dlb0AgQex6Tia7VnDN9OGCLy3+Bs/MtghdVzbIkOJ9SwdAxEh2qHBp6wXDH933rQwuO/70AqXy85KGz9Rwv51yknmZhJssIFxAWf647vP8Rxfjp2/F/lFvbNxgTf5Pd+X8I2OilDdO5uSrox59GCghq9twDG9NoVATI7ynv6Eb84f96kkYE8WkbeMntP+OcBLrtPyXu83Zb2D77MEJjBg6kax1FCcF2urORw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZZbaWFAJb7t/dmQkonsMcyTbzR+CJGS1FgkisW2pVQI=;
 b=sDsjhtR58H1w6SQL/1hu3LBSeX6/Vy9csnCX+goEa5DgSo9kObeLKRNHi6QpbSZQib0459hUK7RXs+sDFpoiXsC+7wWxzW+gn0qyLcxl8PHN+2GpRuf/oTo1v+6HlEBJKDwF5+RdvNRbLzbHJH4hB1Yb1hlfe5MR/nUjx0nsfBbB47r0CK4Sw81EZ4x455msEvGAXq/Et7LHcP+OGJIRA9yPTwR7G1FZ6dMg+M/DEd1GXd1DeM+GNf9zad+McRng3GU1lQsF6wOTPy70DEe+b0n4MVqc3m0/k885TZv2jKaMcZoV/fvO8lASP2tbPN7gkywyav+LcsRMDkpHKAbDbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5302.namprd11.prod.outlook.com (2603:10b6:208:312::7)
 by PH0PR11MB4886.namprd11.prod.outlook.com (2603:10b6:510:33::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Tue, 27 Jan
 2026 09:54:59 +0000
Received: from BL1PR11MB5302.namprd11.prod.outlook.com
 ([fe80::f19c:833c:9f41:f3de]) by BL1PR11MB5302.namprd11.prod.outlook.com
 ([fe80::f19c:833c:9f41:f3de%6]) with mapi id 15.20.9542.010; Tue, 27 Jan 2026
 09:54:59 +0000
Message-ID: <6eef0292-3ad1-4e87-a07e-a2375885b76b@intel.com>
Date: Tue, 27 Jan 2026 15:24:50 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v6 07/10] tools/intel_hdcp: Interactive keypress
 thread for menu
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "B S, Karthik" <karthik.b.s@intel.com>, "Thasleem, Mohammed"
 <mohammed.thasleem@intel.com>, "Nautiyal, Ankit K"
 <ankit.k.nautiyal@intel.com>, "Konieczny, Kamil" <kamil.konieczny@intel.com>
References: <20260119123142.504623-1-santhosh.reddy.guddati@intel.com>
 <20260119123142.504623-8-santhosh.reddy.guddati@intel.com>
 <DM3PPF208195D8D162C4D2DEB3BA817FD41E389A@DM3PPF208195D8D.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
In-Reply-To: <DM3PPF208195D8D162C4D2DEB3BA817FD41E389A@DM3PPF208195D8D.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0103.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::17) To BL1PR11MB5302.namprd11.prod.outlook.com
 (2603:10b6:208:312::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5302:EE_|PH0PR11MB4886:EE_
X-MS-Office365-Filtering-Correlation-Id: 23c2b908-1b09-4888-cee9-08de5d8a21e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bnR5ZzJmb2t6bWsyQThYSnpnS0dwSXJ6N1RqQkhJaGRkanB1WEl2Vys0Q2Fx?=
 =?utf-8?B?cng3WVllaVFQYmR6ZThnRitMZ3RFclZNYXRxUHR5dTRyY0JSL29CUlE4Z3dH?=
 =?utf-8?B?V1hrc053Z0RmcDVtb1doVnJoRmJxWW40bnI5VURCM1g2T2lSTStiNk4zU2l3?=
 =?utf-8?B?VWIrQ3hLTE1VVElPYW5CK0lvL09mMURKSWJVanRnQkE0eU1vbDVwTllJRVYw?=
 =?utf-8?B?cGZlSkVpby81eHAxTTMvWXoycUFxME9ucVQzb3hqUFk0TUtFL0tmWi9hMHlt?=
 =?utf-8?B?emVFN2FkenRVN2JkeHVKcWoxcHdWM2J4amZ5MHFtR0g1RU1NbFNYQXlqNnMr?=
 =?utf-8?B?MTdYalN1dE51OHdQRmE4dVR5eU9EQ2pMNjNlQkp2Q2xBZTBNVUVjcnM5QXdJ?=
 =?utf-8?B?Y0JmdFB2UTJEWTJqZGZHNmRIYzB0ZUM4aFJXaW9BL3IwVDdPc3lOTjR6TE9v?=
 =?utf-8?B?UzQ2RTRoSjQyYUxsa3NJblZCM3FXMDYrOUkzc2d2MXd4UytTMzFVYkxjNHNZ?=
 =?utf-8?B?UVIzZGFoK05JUGlmYjF4aWZHMGhVRSt2WlB5NGVacUVTZHpOd3BpM3ZFY1Fi?=
 =?utf-8?B?YVdFd2o5MjJSSzF2UVMrelJnQ1pDbE5LQlFWSHVZbmNBVktKRXBzV1VxQWhz?=
 =?utf-8?B?MitqVllCcGhvN3ZqbjJObG5MUTZBVDZmOW4xZ3dNbzlGejkyWWFqb2k3WEhm?=
 =?utf-8?B?cDFLbUVBeW94aUx0T0ZsSWxaL1dFNHg3QTFFaU11U1QwclA0TjlFZmVCOTZU?=
 =?utf-8?B?ZW1EeGlFNTNqeVJGRXRvZlpSMW51eGx2Zm91WHhKemgrNE41dzlpQjRJajFx?=
 =?utf-8?B?MGhFa3g0QWF5MS9DWTZlODBaOVlWSkpVWDBSam5nMHBUTWdBblpXWHAzTDlK?=
 =?utf-8?B?S0JvcThhT0xTZ2JDVjkxOFY1VXhkYkNIZzRZRS8wSGlncFlPbzhQRjN6V1BT?=
 =?utf-8?B?V0xOQTRaams2a2EyaHNabndJTnBDd1RFQ1IzZUF4L1E2OTdnMEUvOW1UOGJa?=
 =?utf-8?B?SWhVcEFHNHJFYkFkeDloelhZbERoNkR5Sm94N29sVTVBOXo4eS93eE5XQ1lu?=
 =?utf-8?B?ajloeDlpd1VQd0pidlhIMExkSjg2TDJrVDNkWjNZSUVaT3dPb3pzTjRYMStJ?=
 =?utf-8?B?TXdrK1VTYUlyQUYveEUyMVB2UDlqT3lKcGVaZk16cmYyZVkyamU2aXc2VytT?=
 =?utf-8?B?dFJmNFNqZVRxTHJiLzlFK2VwYVF1MHI0Z2l4WUFMYllnT01ab2N6dzNZeFZT?=
 =?utf-8?B?dmQ1TXJrNlRFbnJCZnBUdm1MTk5PUWlQaWxiV0Jic3dOKzlIbWVpUXFaTmVs?=
 =?utf-8?B?QjZFTUJna2cwY1U0cGw2ZVpLR0R6ZFJhck5uSzhEUWxnYkM4ZGlYVEtudGJa?=
 =?utf-8?B?YS9ES0pUTHVzK1AxSHlyNjhjd3N0dzVMdWVldHd4QnhZMDRITW1FOUZPT0lD?=
 =?utf-8?B?cEpGTm1FYzRYSzVYSnF2azk1WjVFNmM4YVdUYXJGZlExK2lxZHRYQi9hb0N0?=
 =?utf-8?B?aW00UFFYZWorRFk1TGg2bUd1VFRPVCtBOWRJaFB3cGtuMG1HZ2k3QWNXWHBD?=
 =?utf-8?B?QUpSbFJpK1VBYWZhWmZXSHM3WlZjZWpSWGNkWW4xMTN4TFRVU2xyRTI4Rkt1?=
 =?utf-8?B?NzErUEZaQW8zNEN1TGhiUTVUSk9NSjB0QTduVUVhbVQ5RTBKSTJ5M0tuR0gx?=
 =?utf-8?B?Vm55dElXUTJmNW5GWEtlU21XeGFNMHlZdEYxSWkwWFZiYXFsT3lEcXF6NWVn?=
 =?utf-8?B?ZlNaY284cGdZUlVta0xsNG54bjdJUzhRVm16VmFkQTAxVjRpQ1hmU01mdm9m?=
 =?utf-8?B?YUNnaUhkUW50Y1gyUzdJUEZ6MEp3R0EvMW0rVkkzNE4vUlduRmFSSXliVFZT?=
 =?utf-8?B?SGlGZ3h5YnhQd2VzVVhiK3RsYU53WXMxQXJReFVobE9lTzRxdFJJdWRDT3R2?=
 =?utf-8?B?MmxkaDlBQ2djS0ovRGd2aEhqd2xONGcrMXZhd3RZbVJ5dzFRU2ZPM2wxNlUz?=
 =?utf-8?B?M2dCUW8xNFpsM1lWYkpJWm1GcjYxS051blF5V0FiaE4yV3g0ZnEvLzYzOTY4?=
 =?utf-8?B?aEU3bHR0VjNxOHdtYVFzTWxQWUhRdkkyaUt5Um9Cc2M2WjJ2aGVDckFKQjNa?=
 =?utf-8?Q?GK8A=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5302.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cDhLMDhPUFRMWnMwVnN1YmEvRnZpV0VTRXVITHMwaTdabjd1TS9VS2F1WlND?=
 =?utf-8?B?dmI0NnY0bVkxaFI4RCs5NFZ4YVc5RTFROVYzdWhqOURJcXRQV29GeDhyaFlS?=
 =?utf-8?B?REljYk4wbk4wUE1wbEtLS0lLNDc0ZGtKcEttK3FjTCtjMHZPMURyZXN4d0pm?=
 =?utf-8?B?SzQwUkQ2QjhwZHg4S2hrVUJINFBVNmxZWGZoRE1DY0d2OEhtYnhWby9kdUd2?=
 =?utf-8?B?NDB0dWwvU2tXbjJLeWZOSis5S3F1OUFJZ0ZHdGYwQXpyeWVHWnl0c0FTYzVP?=
 =?utf-8?B?ckd3RnRjbHo0SjFUL1VQYnVGMHUrekFaYUhtbW04M0QxYllSdXB2d1pwd0hY?=
 =?utf-8?B?QlhvRkFGa0ZlUDZpK2lZQWlUbHdybWkwdmdZNGJvUVlzR2UzM3kzd3ZXNjVv?=
 =?utf-8?B?dS9BYnc3d3NiekNvYXpXRDF6WmJWdXlJMW9ZZzZtSWJoNGczTUtTMy85bkVu?=
 =?utf-8?B?azNzekdRT3pHTnFuVlBocnkwcTZVdkZDUzJxWDIxMGxrYVBmb3lVUWRrTXB0?=
 =?utf-8?B?R2tCRU83RlVtSjh3RUFXQjFXcmYxbUt0NTdDcWlMc0dReTZER251TmtXRWdk?=
 =?utf-8?B?WFdXLzlOUWVGRmFpRmlZd1Z2dGkzcENSTVdoTFlObndIcHhWTDIyaVZiMy9C?=
 =?utf-8?B?V0s2RE0xRVZyUFBvdk96NlZ6YnRjZkNmWXcrdUV5ajNvQmZTUXZkaTFVNWN5?=
 =?utf-8?B?KzZvanRwSXdYOFJQZ1p2N3AzV29HRUYxQ2FlVG9kd3ltWitIK29PR0VCaS9C?=
 =?utf-8?B?Yzl3VlJFcDNINUVNZHdWUWxOWGxZaFJmVTFoN2hUeGRyTmhnZ3NWczg2bVZJ?=
 =?utf-8?B?akRUQW9IRi83bjBzRUpmYlJhZXVoSFBVZ1FUOWZWTlowbzlSN3hpOFVzNmJP?=
 =?utf-8?B?aUlRRjNhVGxScXBEUmpMNnBNRUdLb09TV0VLSEo3bmZQOWRTS3JMUWRBZ3ZX?=
 =?utf-8?B?cVMzT0tCQWdLQXdIN1pCeThEcEJkQlRhek9mTUxRSWlMTnRYQVFHNWcrWW9K?=
 =?utf-8?B?U1kwT2FIMXVoNlV2WGt4czd2SDB5RVNiVXh2Z2dDYjZiTGRDclc0djRmbWdm?=
 =?utf-8?B?NkgvTWpKTHRjVmZUaWNYT0xaclU3SzVvdVE0d0tZN2N6M0FteEdSeXhxdVYy?=
 =?utf-8?B?SWFNeitXRGtXM3paUkIrUjhqS0pzdXFtTUxEU1JMR2NDeU5lbGt3bkxvcGU5?=
 =?utf-8?B?bm9KUkoxN0xtZk9ic2NVaVhFYU51R2ZiOXNCaTJnek5Yc3NJSkZFSmhncmkv?=
 =?utf-8?B?anZaZkVlanZZWEpuc1VINmV6cm1rRHZSS3BEVGRwc3VzemQwT1lLakZ2QUk2?=
 =?utf-8?B?UzZpZUVJOXdsNFp0OWovR2JpZmlMc0F2SjBHS1ZaaWdoM2FiNjVVb0hIUXhn?=
 =?utf-8?B?ZFlQUmFyQ0UyT1lWWGJ3d1RuU1FkWVNQZk9BRWp4cHY3eElzeXVjQ1FVczFy?=
 =?utf-8?B?Q0RoQmROVkpBR3N5eGhSOURXZDlyYXc4UWlYQ2Y1akxTeHBwb2RRdHJ6TC9n?=
 =?utf-8?B?VEp4MERpVHpNcCtlVVUvZEx3bHhPVWJhZ05ualk5alVjR3R2NTJ5Y1IwSGt6?=
 =?utf-8?B?TFlDU0cxM3NJdGt3RTZLTWZ3VjRSemt0dTRVbkFJclN4UnFvZlBGR1dJbXU5?=
 =?utf-8?B?ZFR6VnpxcGNNTSt1UDNQQmlobHRDUFNLeXdpWjQzd3U2Q2xaUzBENGp4ckc1?=
 =?utf-8?B?VmE2Qjg0VnRGU25vMlNJaktWdG42NlBHa1BNZXhNL0RyWWoxamExODNYbXpo?=
 =?utf-8?B?TGhFN2huQnlELzU3Z2twa0o4UTlhUktuSGI0WUhkeG8zMDdnT3Brem5BN2Rr?=
 =?utf-8?B?MzE2WGloaXA0UUJqQjFOMnR2NTVTK1pQVlFGdDhoR3c1MHc4ME43QnZqS3lx?=
 =?utf-8?B?VWsrb1pYRkNkRE4rTUl5NW9ZeWdCT0cwMHJteUN4cUZybHhyME9CV2pNcDB0?=
 =?utf-8?B?aGpaR2d1cXIvVEgrVGJBZjgzZWUyT3pOTHhvU2RUVEJIRHVCTEVoRGttK1U0?=
 =?utf-8?B?ak9QejBqR1pKSHdRb0g5RGpXTU16M2E0RmtaV3VOK05ZTVlyZ2N4S3ZKaFVk?=
 =?utf-8?B?QjJuQThtTlVHNk1IbHgySmM3YlNHeGdKLzRCTGpBdjJWb05pQXk1NE1aMGsv?=
 =?utf-8?B?blFJa1BSenhaT0dhRmpGdFlzQnp0V1ZLcHZ1Nms5b0ozVUJQWHo0YUsrQktH?=
 =?utf-8?B?L204ZGFYaHU2YVorR3hCOFpIbkdvWmF6VUUyTXIyR1VPNEJtVTMyVVhSb1lV?=
 =?utf-8?B?dDA5U3ZzNER2ZFdIaU82cEl4RHhLcHRSMHcvZk5XWld4TDRBOGpKclg0Z2tY?=
 =?utf-8?B?eHNqR0NkeHZoV0NFcy9mQ0RMMGNRZWpUWXcwRHNyc2RCZnA4a1VmOWtBaVRY?=
 =?utf-8?Q?TaQ+9YklUQ+qooP4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 23c2b908-1b09-4888-cee9-08de5d8a21e2
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5302.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 09:54:59.2860 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f5RTQxCuXe5k9rvFyreMmB0+WFnUbGQvuqbMETqHiuasftcp/+ve6bpksiLv7pgagoDrXquvzULCpGWcDCax9Bn/IK79TFTpIlEIKZCzPF/qM2CFk+dKb5rHcMKDt22u
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4886
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



On 20-01-2026 09:19, Kandpal, Suraj wrote:
>> Subject: [PATCH i-g-t v6 07/10] tools/intel_hdcp: Interactive keypress thread
>> for menu
>>
>> Handle user input asynchronously with keypress_thread ,enable interactive
>> HDCP via user options.
>> Update print_menu to display available actions.
>>
>> v2: Handle invalid user input like choosing an invalid connector or non HDCP
>> supported output
>>
>> v3: Use menu lines to print, Avoid reverifying the user input connector id to be
>> valid or not for HDCP. Instead display only HDCP supported connectors to the
>> user and verify the option provided by user (Suraj)
> 
> Nit :
> Try defining it as points
> V3 :
> -
> -
> 
>>
>> Introduce validate_input(), get_valid_hdcp_connectors(), select_connector()
>> and handle_connector_selection() to parse user input.
>>
> 
> Move this above the versioning info
> 
>> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
>> ---
>>   tools/intel_hdcp.c | 205
>> +++++++++++++++++++++++++++++++++++++++++++--
>>   1 file changed, 199 insertions(+), 6 deletions(-)
>>
>> diff --git a/tools/intel_hdcp.c b/tools/intel_hdcp.c index
>> b96fc570f..bc0485caa 100644
>> --- a/tools/intel_hdcp.c
>> +++ b/tools/intel_hdcp.c
>> @@ -5,6 +5,7 @@
>>
>>   #include <fcntl.h>
>>   #include <stdio.h>
>> +#include <ctype.h>
>>
>>   #include "igt.h"
>>
>> @@ -29,8 +30,23 @@ typedef struct data {
>>   	igt_output_t *output;
>>   	enum pipe pipe;
>>   	enum hdcp_type hdcp_type;
>> +	int user_cmd;
>> +	bool running;
>> +	pthread_mutex_t lock;
>> +	pthread_t video_tid;
>> +	int selected_connector;
>>   } data_t;
>>
>> +static const char * const menu_lines[] = {
>> +	"=== HDCP Tool ===",
>> +	"1. Get HDCP Information",
>> +	"2. Enable HDCP1.4",
>> +	"3. Enable HDCP2.2 Type 0",
>> +	"4. Enable HDCP2.2 Type 1",
>> +	"5. Disable HDCP",
>> +	"q. Quit"
>> +};
>> +
>>   static void set_hdcp_prop(data_t *data, int property, int type, int
>> connector_id)  {
>>   	drmModeConnector *drm_connector =
>> drmModeGetConnectorCurrent(data->fd, connector_id); @@ -223,12
>> +239,190 @@ static void get_hdcp_info(data_t *data)
>>   	drmModeFreeResources(res);
>>   }
>>
>> -static void print_usage(void)
>> +static void print_menu(void)
>> +{
>> +	printf("\n");
>> +	for (size_t i = 0; i < ARRAY_SIZE(menu_lines); i++)
>> +		printf("%s\n", menu_lines[i]);
>> +	printf("\n");
>> +}
>> +
>> +static bool validate_input(const char *input, char *choice) {
>> +	const char *p = input;
>> +	const char *rest;
>> +
>> +	/* Trim leading whitespace */
>> +	while (*p && isspace((unsigned char)*p))
>> +		p++;
>> +
>> +	/* Empty input */
>> +	if (*p == '\0')
>> +		return false;
>> +
>> +	*choice = *p;
>> +	rest = p + 1;
>> +
>> +	/* Ensure rest is only whitespace/newline */
>> +	while (*rest) {
>> +		if (!isspace((unsigned char)*rest) && *rest != '\0') {
>> +			fprintf(stderr, "Invalid input format\n");
>> +			return false;
>> +		}
>> +		rest++;
>> +	}
>> +
>> +	return true;
>> +}
>> +
>> +static int get_valid_hdcp_connectors(data_t *data, int
>> +*valid_connectors) {
>> +	drmModeRes *res;
>> +	int valid_count = 0;
>> +
>> +	res = drmModeGetResources(data->fd);
>> +	if (!res)
>> +		return 0;
>> +
>> +	for (int i = 0; i < res->count_connectors; i++) {
>> +		drmModeConnector *connector;
>> +		char *output_name;
>> +		const char *hdcp_support;
>> +
>> +		connector = drmModeGetConnectorCurrent(data->fd, res-
>>> connectors[i]);
>> +		if (!connector)
>> +			continue;
>> +
>> +		if (connector->connection == DRM_MODE_CONNECTED &&
>> +		    connector->encoder_id != 0) {
>> +			asprintf(&output_name, "%s-%d",
>> +				 kmstest_connector_type_str(connector-
>>> connector_type),
>> +				 connector->connector_type_id);
>> +			hdcp_support = get_hdcp_version(data->fd,
>> output_name);
>> +			free(output_name);
>> +
>> +			if (hdcp_support && strcmp(hdcp_support, "No HDCP
>> support") != 0)
>> +				valid_connectors[valid_count++] = connector-
>>> connector_id;
>> +		}
>> +		drmModeFreeConnector(connector);
>> +	}
>> +	drmModeFreeResources(res);
>> +
>> +	return valid_count;
>> +}
>> +
>> +static bool select_connector(data_t *data, int *valid_connectors, int
>> +valid_count) {
>> +	char input[256];
>> +	int cid;
>> +	const char *q;
>> +
>> +	printf("\nValid HDCP-capable connector IDs: ");
>> +	for (int i = 0; i < valid_count; i++) {
>> +		printf("%d", valid_connectors[i]);
>> +		if (i < valid_count - 1)
>> +			printf(", ");
>> +	}
>> +	printf("\n");
>> +
>> +	while (data->running) {
>> +		printf("Enter connector id (blank to cancel): ");
>> +		fflush(stdout);
>> +
>> +		if (!fgets(input, sizeof(input), stdin)) {
>> +			fprintf(stderr, "No input; aborting action\n");
>> +			return false;
>> +		}
>> +
>> +		/* Check for blank line (cancel) */
>> +		q = input;
>> +		while (*q && isspace((unsigned char)*q))
>> +			q++;
>> +
>> +		if (*q == '\0' || *q == '\n') {
>> +			fprintf(stderr, "Cancelled connector selection\n");
>> +			return false;
>> +		}
>> +
>> +		if (sscanf(input, "%d", &cid) != 1) {
>> +			fprintf(stderr, "Invalid number; try again\n");
>> +			continue;
>> +		}
>> +
>> +		/* Verify connector is in valid list */
>> +		for (int i = 0; i < valid_count; i++) {
>> +			if (valid_connectors[i] == cid) {
>> +				data->selected_connector = cid;
>> +				printf("Using connector: %d\n", data-
>>> selected_connector);
>> +				return true;
>> +			}
>> +		}
>> +
>> +		fprintf(stderr, "Connector %d is not a valid HDCP-capable
>> connector\n", cid);
>> +	}
>> +
>> +	return false;
>> +}
>> +
>> +static bool handle_connector_selection(data_t *data, int cmd) {
>> +	int valid_connectors[32];
>> +	int valid_count;
>> +
>> +	/* Commands 2-5 need connector selection if not already set */
>> +	if (cmd < 2 || cmd > 5 || data->selected_connector != -1)
>> +		return true;
>> +
>> +	valid_count = get_valid_hdcp_connectors(data, valid_connectors);
>> +
>> +	if (valid_count == 0) {
>> +		fprintf(stderr, "No HDCP-capable connectors available\n");
>> +		return false;
>> +	}
>> +
>> +	return select_connector(data, valid_connectors, valid_count); }
>> +
>> +static void *keypress_thread(void *arg)
>>   {
>> -	fprintf(stderr, "Usage: intel_hdcp [OPTIONS]\n");
>> -	fprintf(stderr, "Options:\n");
>> -	fprintf(stderr, "-i,	--info		Get HDCP Information\n");
>> -	fprintf(stderr, "-h,	--help		Display this help
>> message\n");
>> +	data_t *data = (data_t *)arg;
>> +	char input[256], choice;
>> +
>> +	print_menu();
>> +
>> +	while (data->running) {
>> +		printf("Enter input 1-5 or q: ");
>> +		fflush(stdout);
>> +
>> +		if (!fgets(input, sizeof(input), stdin)) {
>> +			printf("\nExiting...\n");
>> +			break;
>> +		}
>> +
>> +		if (!validate_input(input, &choice))
>> +			continue;
>> +
>> +		pthread_mutex_lock(&data->lock);
>> +
>> +		if (choice == 'q' || choice == 'Q') {
>> +			data->running = false;
>> +			pthread_mutex_unlock(&data->lock);
>> +			continue;
>> +		}
>> +
>> +		if (choice >= '1' && choice <= '5') {
>> +			data->user_cmd = choice - '0';
>> +
>> +			if (!handle_connector_selection(data, data-
>>> user_cmd))
>> +				data->user_cmd = 0;
>> +		} else {
>> +			fprintf(stderr, "Invalid choice: %c\n", choice);
>> +		}
>> +
>> +		pthread_mutex_unlock(&data->lock);
>> +	}
>> +
>> +	return NULL;
>>   }
>>
>>   static void test_init(data_t *data)
>> @@ -290,7 +484,6 @@ int main(int argc, char **argv)
>>   			break;
>>   		case 'h':
>>   		default:
>> -			print_usage();
> 
> So here is my problem with this patch you add all these functions in this patch which you do not use here which is understandable since you do not have all the
> Gears to get it working but the you delete print_usage() here which means at this point of the patch something that was working breaks
> 
> I would like to keep print usage here as is and delete this in the 9th patch where you add all the other necessary fitting to get the new upgraded tool working
> 
> Regards,
> Suraj Kandpal

Reverted the print_usage() deletion and deleted this in 9th patch.

Thanks,
Santhosh
> 
>>   			break;
>>   		}
>>   	}
>> --
>> 2.34.1
> 

