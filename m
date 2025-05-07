Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F240EC3ABC0
	for <igt-dev@archiver.kernel.org>; Wed,  7 May 2025 20:48:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A861210E8AF;
	Wed,  7 May 2025 20:48:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J+cg6F+0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9D8A10E8AF
 for <igt-dev@lists.freedesktop.org>; Wed,  7 May 2025 20:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746650906; x=1778186906;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=i0VapMBM2AKTaXL8DXSsmfjG4yk9LABxqW5Rfd5055M=;
 b=J+cg6F+0FXy5BEo2WdjQjS4l4Cq0WEilNykV/aHzbv2g6EY+jPNGlGNf
 ZXhP0IxaMe+n0PM/PLN2zCZWDva+9RdSWt7LArk3V5g3MRE3q/XqNT9tf
 8NlDDcouDHMsxDx9tFSAJN+TJ4TB2T3PHVCFDBQyUzw+qIDmDMqE92TH9
 Q3Q+PYi9cLCRKmMoZdvU4ta03duk7ojJE6Sl5IYRu2LRPbMG/V9WxZGpS
 DCqLsxGDpVYY+nKrnWOP4oK6S1p61QooHCekhLemN3XwZzCwTh/0nfeeF
 dUHeSVbRIkR43uB7yFEJOvp2Zd5/sZ6zQLfk8MgyJMa7OSntqiaGcFmkr g==;
X-CSE-ConnectionGUID: EWi8NijGTRWkWedFur+DJQ==
X-CSE-MsgGUID: V5FFLreWT4i4ozGs8rSVSw==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="48275941"
X-IronPort-AV: E=Sophos;i="6.15,270,1739865600"; d="scan'208,217";a="48275941"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 13:47:17 -0700
X-CSE-ConnectionGUID: YJkBaLSiTjG5ZLmSGnThew==
X-CSE-MsgGUID: lxz7MG2ATw6OA1hIH1Wzkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,270,1739865600"; 
 d="scan'208,217";a="167135314"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 13:46:40 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 7 May 2025 13:46:39 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 7 May 2025 13:46:39 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 7 May 2025 13:46:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XAnNbud3CBAUXbFnVBQtsXMldTF/uw7OCqIb+Nu+e3lbDqlkTCV+mcSzLYoPo/bP5cK37g1fCvbw4Az+OMoWTdTvuLjqa6UZTTrwKueGZIqtpd42xzqut6cxt1cDxRQZ2dEKQZJVTZGkVDZdg4t9Rp8FpWVNo9Lcmszh0yMXppJ3LRvoumu6RZHc/W/KHctWSzZFnZK6QWlgFoM1KgumPhwb/5fVacZDba0BKdVBo6St8WM6+ImJjvs0i0UxozaObi6zwyKDighIMHTDIjpnJg3IkSB84h4BHFWDku6FS8N2HJCITmV/BE7BFsInkt6htS0+W+68CiEHBOBmKASb/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vj38kCeTbw+RFrH8t50NtnGHh4VKgjCap5Zx9J/nQW4=;
 b=YKxaD9zyUj0+8IrFCHfxLc3Aq4u49ZO0gWea6+MWnAysyrqmEkxYxNoriqNiplSRrFoZG1Gfj7dj1e7Rj/t59C1UqpwKmZNCJYOwIGpIJ8A+MUI2qJR2Qo1YhITk698bqxR6PKSUZW0kZzn2BXOzGKfk/8EZgLAa/gfEt6hvJSbuBK84Rf0LD9NN6jgOFhR31mNVJXkeZNzUCoz+3mCeK2i3isBo+V2mkdjhgbtIXjj8W2ygjjj0Q6I79L5AqM+BFiSSwU2ri9lLCEzYWA5+ujY4nLS9LhPSjqa+fnqSlZorH9zBl76uIun4C/UnDCWUlNQH2iWxBiKXcMPeYoV9lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA0PR11MB4751.namprd11.prod.outlook.com (2603:10b6:806:73::9)
 by CH3PR11MB7842.namprd11.prod.outlook.com (2603:10b6:610:128::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.24; Wed, 7 May
 2025 20:46:35 +0000
Received: from SA0PR11MB4751.namprd11.prod.outlook.com
 ([fe80::27c5:cf9:78f2:a2b3]) by SA0PR11MB4751.namprd11.prod.outlook.com
 ([fe80::27c5:cf9:78f2:a2b3%3]) with mapi id 15.20.8722.020; Wed, 7 May 2025
 20:46:35 +0000
Content-Type: multipart/alternative;
 boundary="------------z0rMghr8T0kIxQ5WXXWjbx8o"
Message-ID: <484419a0-9751-499f-aaef-ac3737eaa6d0@intel.com>
Date: Thu, 8 May 2025 02:16:28 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v4 3/5] runner/settings: Add function to set
 IGT_DATA_PATH environment variable
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, <kamil.konieczny@intel.com>,
 <swati2.sharma@intel.com>
References: <20250325210146.3338454-1-ramanaidu.naladala@intel.com>
 <20250325210146.3338454-4-ramanaidu.naladala@intel.com>
 <20250404152138.nxtjl54vgvewe6dg@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
From: "Naladala, Ramanaidu" <Ramanaidu.naladala@intel.com>
In-Reply-To: <20250404152138.nxtjl54vgvewe6dg@kamilkon-DESK.igk.intel.com>
X-ClientProxiedBy: MA0PR01CA0113.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::14) To SA0PR11MB4751.namprd11.prod.outlook.com
 (2603:10b6:806:73::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA0PR11MB4751:EE_|CH3PR11MB7842:EE_
X-MS-Office365-Filtering-Correlation-Id: b0b18e41-5102-4667-bedd-08dd8da841bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aTh6VXBTSVBrbkt6dUVxYU8rLzBxVG82ZDBKQldGa2Z0VlJqYTluRlFLSVow?=
 =?utf-8?B?bU13WXZHaFhvNlVoMTJVOC9Eb1craE1Va1NrVXBUSTVUWGdqSVVaTW0yQlhT?=
 =?utf-8?B?eW5ReUJjQmR4d0pWa1lQMFFRei96Y3RtN21XRjZyRHU0R3ZLQXVmOVIvOUpz?=
 =?utf-8?B?WmpYVlVPZmc4N200RUZTbWxzWkxkempvbUhzWmhUeFBQbzkrbXZWQjhadFVz?=
 =?utf-8?B?MEpoM3hEcjlxRGVQQ2hBa2VxVFNiTlI1eHMvcEExak5xbUFwd1ljWG9wTlNF?=
 =?utf-8?B?SjB6Wk1ObjROUzdxYVVDQVE5bk1UNHNrNjlDbTUyNGd1bURaWTRrVXlrL1pn?=
 =?utf-8?B?ZE95ZmNjeGRoYVY4OE00Tjd4NnBjSUlzZWx3dWhkWGtidnROT2VjejZIOEo2?=
 =?utf-8?B?ZVUyNHFLUGhVaXZNcEd0RVpqQmcyMm1TUHBXWFFDTGtxZkgra1ZUcWRpdVhm?=
 =?utf-8?B?S2xmdzZOR3hpSUF6TFg2RXdkaS9FNnNhdHc5YkNpRmVYb2xPU1A0Mmxneisw?=
 =?utf-8?B?eEVJTjExU01KcGIzQjZqT2prVjNUeXFJamlSV01veWt5THI3WHVMV2FYTjRZ?=
 =?utf-8?B?c2dLQWpScXVHVVFrOXZLS3BIZlF3SWVCYWluY21oMnZjaTQ5NWJ2NG1rcXh2?=
 =?utf-8?B?VVlDV1lMK3A5dDI1KzhZK2lkNnhCN1lQeGh2cGNoRDl1WVhEL2ZzeGZPOVBw?=
 =?utf-8?B?NStMTkNIRWFWeGJ4SFhxY0VvamRuM2lQT2ZLaGYwTnk0NmltVDNUTzlZaHdt?=
 =?utf-8?B?TnFiNFJIV080cVFJOWoyTExkVHl5ajZKWFJnMW4rcmd3OWlzRjdrbXBPL2lV?=
 =?utf-8?B?WjRpSHNZR3g5Z1RXS1c2T2IwSVdVRElYT0tRLzFJdjJ2RjZGQ2FUT2cwaG80?=
 =?utf-8?B?K0hheVovWHZKbGZ1OWI0c0NMTUtaODdjVEoxNXRlUlRNU1lXcmhIZmg5VFhW?=
 =?utf-8?B?NXd3RmJQYUF1TEtzMUpkWUdQSUlTeDBUMDdFQUhTeEpxVEFZUXo4dHNLYjF1?=
 =?utf-8?B?RUtVSEhJckEwVlhnaG43eUVJTHBRSU9rbGhvQmRWeERVdzVGVU9OMDAxU09B?=
 =?utf-8?B?NEZHcFRMSVk2emRzTnJXTTh1ZlN0clUxdExBemV0eGdLcUdROExHUGYrTWxR?=
 =?utf-8?B?K2VzOUNqWHdDc3JTREFsT2gyWTRCYjVXTnNJd0ZaOTFscXdXSzdseHUxSCs4?=
 =?utf-8?B?WVdCQU55QlUwMkxMQVE3NGFrYlpLdmZhc29TR2o0MEZQT09TVHkzbmdJVHgz?=
 =?utf-8?B?RWNFNXh4ZUU3eHFHdEVmYnN5dWdYS3RwRjQrUWdVOEp6a3YyTzNtWTdzT2JX?=
 =?utf-8?B?TmtBRHlKTERJRGFDL1MrNnl0YjFNOVRTSlhSemhubkk3VFh1cTRHZWpMQndH?=
 =?utf-8?B?RmhQUnkvaFRvLzExeXFWMnNqYkxRZWpJcGtsaDFZQ2ZPTk82VUphVWdUTy9P?=
 =?utf-8?B?Um1SbWtFWDcybkNQMFd2TkxEbFJLQXZFUkpNb1F5OUdkZnFBeGIrQXBTdE1s?=
 =?utf-8?B?RXgrR1dyQzMvazcvRVdjejA1YWcrQ2UxME54dTJjV3k0MlZmeWdqYlB2T1ZU?=
 =?utf-8?B?Rk9SenhiVElkcFBzaTFSeWFEZ0J2OWlFTVMxTzIwZWprQXh2VWhFb3Y1RVlv?=
 =?utf-8?B?VDRPdG5OM09EZWVjOEVsQ3VvZGIydkI1NUtmOTNxaWw2M2VqZU9CdUpBQkp5?=
 =?utf-8?B?QThmVTB2bzhKUHA1VnVaZzhxdlg4OUMrWldFeFZ1ZGhpNVJCeUZMaWNNQy9o?=
 =?utf-8?B?UkJzUnkyVklKQTFQTEJPZ1pnZHVmdzd3b1ZlUmltdVVkck8zbkxMS0hqSlZY?=
 =?utf-8?B?b2Jsb2lhSXBLM09nK2sxZDlEWmp1dFF3MldFbHVMbFQ4aHZGTHlrVkRXZVQ0?=
 =?utf-8?B?Z3AxYlFVczJISWRibC84Q2Iwa3lSc1J3bmtwejh4VlM2YlBLcTRQMjc3OFhS?=
 =?utf-8?Q?ACj6xoA8jN0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR11MB4751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eFNsZWRwbjR4alZYWHAzSnJDZmtzdTB6dWdMUFkyQmpCTTFlY3hRb3ltbTdi?=
 =?utf-8?B?RHVvcFpxY2h4aTJLenlyekhSY0t4RHBDTDZnb2o2YnNWTUpxd09oKzZ6THIy?=
 =?utf-8?B?VXFZWEZRVmY4elU5Q0JseS8xNm83N0kwVFdhNHp1SUN2R3h2L3p3SmoxZy9M?=
 =?utf-8?B?V2RQcHRGUkdtbGVQWUVKM1JhT0w4Y00yWkxHRUVpazAyRTl6U0l6TTUwUW1X?=
 =?utf-8?B?TEpWSHRDemp5RC8yaUg2ZVZwSHdIbUZTWVZBVEl6amRNcTJxZHBrdU1SV2I4?=
 =?utf-8?B?N2tnNHBWOS9Cek8yREUxbnFld2JnMDlTclNMWTdqVmVwdjNnS3NqTDU4dWc4?=
 =?utf-8?B?VWZMSjdyNFFuQUlETEZqNllJVmF0b3FzcE5CcVI0eDEva1crVGZmbmV4bHNJ?=
 =?utf-8?B?WjVZS3NERVhwdkJ2cDZHMUZFQUptN2IrK0JiSkFyOWVQS3oyNUQwWDN2QnhE?=
 =?utf-8?B?V0xHa1ZrT2Y1czU3eDRFWUZtb3RNb2FxbjNGRVczVitaWkc2cFRMRisvZVZx?=
 =?utf-8?B?ZFd1Z0w0LzJjT24wNnlkUlJiQ0dyREZrS2thYjU3WWJvcWg4OXp0WjlNVWJz?=
 =?utf-8?B?U3VhWTFqMnNCWnBBUHVtOWhKNlpiL0NrbkJSdmFGVjhUa2h1S1ArenoxRUJF?=
 =?utf-8?B?MDVEUDR2eVV0Q1paT1pyZ3pPMmh2TFNUbllGaWw2MFdnWUQ1OVU3T2ZibEdZ?=
 =?utf-8?B?ZTZnQVlweWRZdlhZUkdpeUhTamxkV0dmSUk4WWJPL2phbFVkVnFVK0s1bm13?=
 =?utf-8?B?Skp5STI3cUdGTnVkbWxVazQ4TGNmLytPd01tL1pJZ01ZNEtkUWNvNGp6ek52?=
 =?utf-8?B?dmtCWGNlaTlORXQ4MEhsVm1MUzlucTNLSk0rZVk2VS9TWjdNWFBaN1NiNVN5?=
 =?utf-8?B?RS95bU12YXBRMm9KVi9lQ21MZnpDVzFqaDN1RVRhWURGUk1JUStUcytaT1RF?=
 =?utf-8?B?eVZaOE95RmNjNUx2WVovckZ4MDFYRW1Ed2tVak5LU1dnOXFxak1YRklPalRi?=
 =?utf-8?B?b1FLVHUxcW1kOVhsSDZ5NnE5QTF0ZjhUdzM0dDhHVlVNc2dadHVDb0RlU2R6?=
 =?utf-8?B?Qm1SNFM4UkVKaS9OVlBWcDhBUkVTNUhUdllhQXVkL0JCSHRaMEVWVnVzdmdF?=
 =?utf-8?B?UWNtd2lZVS9tZWcwdDdXUTk0Zm1zVzFVRzJCckFpUU5QOEV6bytsOW1zcHhH?=
 =?utf-8?B?eU1JMWZ5NnRGaWxqcHlRRnVvNWhaMzVOaDRrbW94UnJSMExMNlVoS01uTDAv?=
 =?utf-8?B?a1FySTRSVGF6clcrTmMwdFQvWmhvajZvT1dRRlVWRUVQdTduaEp3K2RJK0NT?=
 =?utf-8?B?NGRQdXVsbVJzQVZYQjNKU09tUjB6VmxJVzlVN05vSGEzUHNzNHZwOHc1R0Nk?=
 =?utf-8?B?SHlXRzlibTNTbTNpa3pKUWdOZVh4cDhQOFpweUJaQnRKazVuQW9Mc1hQTlBl?=
 =?utf-8?B?Z0NzMFh4dlM3a3J0OUU3QU82d0dCZC9MWi9xSExZcmxoMXR0VmJTWUNBRlkw?=
 =?utf-8?B?dzZFSVU3VC9Ra2ZzUHRGU2dFYyswbW4xTXFBYnVvUXdIVW1JNlFVUm5ta0V3?=
 =?utf-8?B?MDBYVldWWDQ0clFtbGV2cWk3a05oNkl4SysrcU5wQzA5eDlyajJzRjZkbVJB?=
 =?utf-8?B?QUpsUlNvSkxkVk5sVG5mNFRHdC9LZkVoZ3dVc3M1bUZZaWlFWDUyNERuQWh6?=
 =?utf-8?B?YWxEcVFlN3ptdVpWcXV6WEM3ajRzcWdNZDNKRUhDSkRxQVhqMWY5QjBGTmtM?=
 =?utf-8?B?VXE3K3F0OEN3WTFma1BXbUdheWw0bzdjTWhjSGFVUzlTUllUcEUzb3B5blND?=
 =?utf-8?B?NGNrVTFENi9oanoxZnBrMzBhbkt4aTh6MUZzQXl4M09pTWQ2VVF2bnhtZTZC?=
 =?utf-8?B?Mks2Skl0MXB0V1dQWlFnVTUyWkhwRk1qcUFWZGdONit0dFpTRjZTN3hwM2Y4?=
 =?utf-8?B?WThsMnNqd3pNVnAxcGg5eVRXQVEyUG9oSm1UbHJyY3BZOFEzQ1hhSjQ2Y2Jo?=
 =?utf-8?B?MTZxaHF6QnNxSjZGWGo0eE5jUUE3UzdjNkVZYW9CVmw4cWgxekVxM2owSWYx?=
 =?utf-8?B?WCtjeENBNC9NcWpQMHJpbW9aS2xvV0J1a3dlZ3RIcGtLc2RiRVpxYVFITmtr?=
 =?utf-8?B?d0VTcEtBYzU4TEdia0pMQk52bW5CdmpyNXRhQmY5cURMbGtJMHVHTms4V0wv?=
 =?utf-8?B?VFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b0b18e41-5102-4667-bedd-08dd8da841bd
X-MS-Exchange-CrossTenant-AuthSource: SA0PR11MB4751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 20:46:35.7412 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7xIey+gUH13OraTbxkgGSomnBz4DI3QxHEhFOZUZEvbXr+AmcpQ1Zf/OG+HpUXToz9EwQWFiZXPeoPQtDyA+ronjDCtah7AR/r6XHDSZ0hg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7842
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

--------------z0rMghr8T0kIxQ5WXXWjbx8o
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Kamil,

On 4/4/2025 8:51 PM, Kamil Konieczny wrote:
> Hi Naladala,
> On 2025-03-26 at 02:31:44 +0530, Naladala Ramanaidu wrote:
>> Add environment variable to obtain absolute path for PNG files
>> at runtime.
>>
>> v2: Fix review comments. (Kamil)
>> v3: Fix review comments. (kamil)
>> V4: Fix review comments. (kamil)
>>
>> Signed-off-by: Naladala Ramanaidu<ramanaidu.naladala@intel.com>
>> ---
>>   runner/settings.c | 22 ++++++++++++++++++++++
>>   runner/settings.h |  1 +
>>   2 files changed, 23 insertions(+)
>>
>> diff --git a/runner/settings.c b/runner/settings.c
>> index 1ccf345d9..94c95f26e 100644
>> --- a/runner/settings.c
>> +++ b/runner/settings.c
>> @@ -612,6 +612,21 @@ char *absolute_path(const char *path)
>>   	return result;
>>   }
>>   
>> +int set_tests_datadir(void)
>> +{
>> +	const char *datapath = "../share/igt-gpu-tools";
> Hmm, maybe try also a build folder for local runs?
>
> ../build/data
> ../../build/data
for local runs image paths are handled/exported by meson. In meson 
imgdir will create the path for image directory.
imho, igt_runner change not required for build/data directory.
>> +	char *abpath;
>> +
>> +	abpath = absolute_path(datapath);
> Make sure abpath is not NULL before using it.
Sure i will change and float next rev.
>
>> +
>> +	if (getenv("IGT_DATA_PATH") == NULL)
> Please make it simpler:
> 	if (getenv("IGT_DATA_PATH"))
> 		return 0;
>
> And here add checks and settings.
>
>> +		return setenv("IGT_DATA_PATH", abpath, 1);
> Btw no need for "1" - you already checked it is unset.
i will fix this in next rev.
>
>> +
>> +	return 0;
>> +}
>> +
>> +
>> +
>>   static char *bin_path(char *fname)
>>   {
>>   	char *path, *p;
>> @@ -654,6 +669,10 @@ void init_settings(struct settings *settings)
>>   {
>>   	memset(settings, 0, sizeof(*settings));
>>   	IGT_INIT_LIST_HEAD(&settings->env_vars);
>> +
>> +	if (set_tests_datadir())
>> +		fprintf(stderr, "Data dir path not set\n");
> Could you also add printing of data path here?
>
> 	else
> 		printf("IGT data/ path: %s/\n", setting->data_path);
>
>> +
>>   	igt_vec_init(&settings->hook_strs, sizeof(char *));
>>   }
>>   
>> @@ -671,6 +690,9 @@ void clear_settings(struct settings *settings)
>>   	free_hook_strs(&settings->hook_strs);
>>   	free_array_deep((void **)settings->cmdline.argv, settings->cmdline.argc);
>>   
>> +	if (getenv("IGT_DATA_PATH") != NULL)
>> +		unsetenv("IGT_DATA_PATH");
>> +
> Please remember that is was set by runner so only unset this
> if runner was setting this env var.
IGT_DATA_PATH is added only for igt_runner use case. For local runs it 
is not required. This env variable is set and clear by igt_runner.
>
> Overall looks good,
>
> Regards,
> Kamil
>
>>   	init_settings(settings);
>>   }
>>   
>> diff --git a/runner/settings.h b/runner/settings.h
>> index 30743fc40..cbcf624b0 100644
>> --- a/runner/settings.h
>> +++ b/runner/settings.h
>> @@ -156,5 +156,6 @@ bool serialize_settings(struct settings *settings);
>>   
>>   bool read_settings_from_file(struct settings *settings, FILE* f);
>>   bool read_settings_from_dir(struct settings *settings, int dirfd);
>> +int set_tests_datadir(void);
>>   
>>   #endif
>> -- 
>> 2.43.0
>>
--------------z0rMghr8T0kIxQ5WXXWjbx8o
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi Kamil,</p>
    <div class="moz-cite-prefix">On 4/4/2025 8:51 PM, Kamil Konieczny
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20250404152138.nxtjl54vgvewe6dg@kamilkon-DESK.igk.intel.com">
      <pre wrap="" class="moz-quote-pre">Hi Naladala,
On 2025-03-26 at 02:31:44 +0530, Naladala Ramanaidu wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Add environment variable to obtain absolute path for PNG files
at runtime.

v2: Fix review comments. (Kamil)
v3: Fix review comments. (kamil)
V4: Fix review comments. (kamil)

Signed-off-by: Naladala Ramanaidu <a class="moz-txt-link-rfc2396E" href="mailto:ramanaidu.naladala@intel.com">&lt;ramanaidu.naladala@intel.com&gt;</a>
---
 runner/settings.c | 22 ++++++++++++++++++++++
 runner/settings.h |  1 +
 2 files changed, 23 insertions(+)

diff --git a/runner/settings.c b/runner/settings.c
index 1ccf345d9..94c95f26e 100644
--- a/runner/settings.c
+++ b/runner/settings.c
@@ -612,6 +612,21 @@ char *absolute_path(const char *path)
 	return result;
 }
 
+int set_tests_datadir(void)
+{
+	const char *datapath = &quot;../share/igt-gpu-tools&quot;;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Hmm, maybe try also a build folder for local runs?

../build/data
../../build/data</pre>
    </blockquote>
    for local runs image paths are handled/exported by meson. In meson
    imgdir will create the path for image directory.<br>
    imho, igt_runner change not required for build/data directory.
    <blockquote type="cite" cite="mid:20250404152138.nxtjl54vgvewe6dg@kamilkon-DESK.igk.intel.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+	char *abpath;
+
+	abpath = absolute_path(datapath);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Make sure abpath is not NULL before using it.</pre>
    </blockquote>
    Sure i will change and float next rev.
    <blockquote type="cite" cite="mid:20250404152138.nxtjl54vgvewe6dg@kamilkon-DESK.igk.intel.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+
+	if (getenv(&quot;IGT_DATA_PATH&quot;) == NULL)
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Please make it simpler:
	if (getenv(&quot;IGT_DATA_PATH&quot;))
		return 0;

And here add checks and settings.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+		return setenv(&quot;IGT_DATA_PATH&quot;, abpath, 1);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Btw no need for &quot;1&quot; - you already checked it is unset.</pre>
    </blockquote>
    i will fix this in next rev.
    <blockquote type="cite" cite="mid:20250404152138.nxtjl54vgvewe6dg@kamilkon-DESK.igk.intel.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+
+	return 0;
+}
+
+
+
 static char *bin_path(char *fname)
 {
 	char *path, *p;
@@ -654,6 +669,10 @@ void init_settings(struct settings *settings)
 {
 	memset(settings, 0, sizeof(*settings));
 	IGT_INIT_LIST_HEAD(&amp;settings-&gt;env_vars);
+
+	if (set_tests_datadir())
+		fprintf(stderr, &quot;Data dir path not set\n&quot;);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Could you also add printing of data path here?

	else
		printf(&quot;IGT data/ path: %s/\n&quot;, setting-&gt;data_path);

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+
 	igt_vec_init(&amp;settings-&gt;hook_strs, sizeof(char *));
 }
 
@@ -671,6 +690,9 @@ void clear_settings(struct settings *settings)
 	free_hook_strs(&amp;settings-&gt;hook_strs);
 	free_array_deep((void **)settings-&gt;cmdline.argv, settings-&gt;cmdline.argc);
 
+	if (getenv(&quot;IGT_DATA_PATH&quot;) != NULL)
+		unsetenv(&quot;IGT_DATA_PATH&quot;);
+
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Please remember that is was set by runner so only unset this
if runner was setting this env var.</pre>
    </blockquote>
    <span style="white-space: pre-wrap">IGT_DATA_PATH is added only for igt_runner use case. For local runs it is not required. This env variable is set and clear by igt_runner. </span>
    <blockquote type="cite" cite="mid:20250404152138.nxtjl54vgvewe6dg@kamilkon-DESK.igk.intel.com">
      <pre wrap="" class="moz-quote-pre">

Overall looks good,

Regards,
Kamil

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre"> 	init_settings(settings);
 }
 
diff --git a/runner/settings.h b/runner/settings.h
index 30743fc40..cbcf624b0 100644
--- a/runner/settings.h
+++ b/runner/settings.h
@@ -156,5 +156,6 @@ bool serialize_settings(struct settings *settings);
 
 bool read_settings_from_file(struct settings *settings, FILE* f);
 bool read_settings_from_dir(struct settings *settings, int dirfd);
+int set_tests_datadir(void);
 
 #endif
-- 
2.43.0

</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------z0rMghr8T0kIxQ5WXXWjbx8o--
