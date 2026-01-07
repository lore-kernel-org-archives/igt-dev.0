Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87286CF6C0D
	for <igt-dev@archiver.kernel.org>; Wed,  7 Jan 2026 08:45:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9BC810E055;
	Wed,  7 Jan 2026 08:45:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FAZWElNw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DAA810E055
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Jan 2026 08:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767775535; x=1799311535;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=LYzPit3KYQvU1z8UV3j6fzvLtS45U5LfAOVJ1DnCdMU=;
 b=FAZWElNwbaUhlS/TMm3KItyzjzouy/zDz+/dS4pz1ZLt6vE1EvdaMMIf
 uZBwK0WueY6HFyvKVHoqQ5FlhRBBjTGIo/DNG7SqUW9jSv19gORN07Hkd
 6CcIku3bpp4+vx+Y3COCL8ZOhocZ41QRSR16c/s2hdtgYPtystxk7ouLP
 fMXHX+D5sFffypQyO43JjQwcJwAb9FsFLE84qMxWVxELoFjOCrlDD904Y
 GUk8XRZKYiCJBT7Wf3or3IcNO19jnoX/ynSrpDqiac4nSWjSX5bLDwU/2
 G1c2AIgnLNWlAA9hofCszlJ6M5W5tnCQQH0DOk0xN/YSsJ87b37sUugki w==;
X-CSE-ConnectionGUID: F3J77b3uR7qPk3kQhzvM/g==
X-CSE-MsgGUID: vT4FKHjGS7afOYMsSLdCZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="86726010"
X-IronPort-AV: E=Sophos;i="6.21,207,1763452800"; d="scan'208";a="86726010"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 00:45:35 -0800
X-CSE-ConnectionGUID: 2tNRK4cJSxOsFd+9WZ/buQ==
X-CSE-MsgGUID: 2OBoJk2iTmKbubJG98AB6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,207,1763452800"; d="scan'208";a="207932983"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 00:45:33 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 7 Jan 2026 00:45:32 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 7 Jan 2026 00:45:32 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.28)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 7 Jan 2026 00:45:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QQmZz9ve6LEgN6zas2J5NRqdOtF9y/eLcaPkbUOuW804Y2UzLilcvn3vuKnpYLrGNNckBgL5Y0J+eZkB1fWKI1/EuN2W6LYgjvxER3Qx2r9Cx8oD3eA1sgMvzoO5sNkr83lGlxTT/VoKa6p9IPZAa+VTtg3IYIU96f7HH+oGLU6rR0bGbYBQLYYh5oOl60iShnOxX4ZUlR1/+9xvdA1iynAVVd4O8ohyxs3cNwBahrOPtczXJo2+HwRxXzuxWttypaKqJ8Xur/KSiB3i88hOnx0b+BDOlZUkODS18nKx8XumCv7N3vdnOXOPblw4iyM49GDiWUdBlcWOTj7+FbmjFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pQ5EdyYhJB2892Ag77PSwWtT+d3kx5EU/KOmwMZJrBU=;
 b=BbJppTP3luMghq1SXjNTec4elESZPBuB12cjQlmg+wBL/6J4qvEw51dy7QMHrwyhanapXayWsvfcLNVpSEZBm1VGFgsOxO5wKmxXfFc7U9JtG8kqEU0FrPerL9kJPiqqVEJWX5pDiej/fbVaxwb7rqX5eDeXDl8OXewLIXvA7FeY88J7T4pvHQUdpnTwmTQCpv5W9DtEcDV2n0ttH+3wUl+QTd+k5HoDvOsE5u3zFGQNpbyAP3p94XfctzOwCPuVnRMW+HO2ufhuue1tC9WBOSiQDC6gwbGYVH07HXkmSEwGqlwijDT9kfc0pvKoinKPQL6KyjXuFrSHdejwJ+b8TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 CY5PR11MB6089.namprd11.prod.outlook.com (2603:10b6:930:2f::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.2; Wed, 7 Jan 2026 08:45:25 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%7]) with mapi id 15.20.9499.002; Wed, 7 Jan 2026
 08:45:25 +0000
Message-ID: <a537a221-6daf-42f9-a4c5-2ce2be1c901a@intel.com>
Date: Wed, 7 Jan 2026 14:15:18 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v4 3/3] tests/intel/xe_pmu: Refine engine activity
 accuracy test
To: Soham Purkait <soham.purkait@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <umesh.nerlige.ramappa@intel.com>,
 <badal.nilawar@intel.com>, <kamil.konieczny@intel.com>
References: <20260106164801.46353-1-soham.purkait@intel.com>
 <20260106164801.46353-4-soham.purkait@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20260106164801.46353-4-soham.purkait@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0173.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1af::9) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|CY5PR11MB6089:EE_
X-MS-Office365-Filtering-Correlation-Id: edf93622-3d7c-4056-e3e4-08de4dc9199f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SUdTSFFKdEdpSWJUcmV3QlkrWE4rVFI5VHF0a2VCaDhWeFlVRHhQb21qN3A5?=
 =?utf-8?B?bUVYTjcwK0paRWFBMlpCRGNUV09wMzVKWVJ4Sysrb0RoUlF3MVp4elNGeWt1?=
 =?utf-8?B?YzdBVURYTUJlcU5RdGFEUlZjRll1ZE1qWWpJd3FMS0hGTlRGYXpyeWMwUTJK?=
 =?utf-8?B?eFBmL0xyQWNmMkRXOFYzSS83R2xFNllMOXZtaTJFOThTaVNwS1h4cXZnQ0F0?=
 =?utf-8?B?eUVkdHcwQkZWaVhqUWlST1BjQjQwSHBEM0ptK2pQNVhjejFkZ0ZEdEJrdzRk?=
 =?utf-8?B?TDRwa0xiU09jSU5yVC8wOEpOczdhdVZDTUQ0VzdpaGNSQXhQTGNHbjBhYkNq?=
 =?utf-8?B?ZHQrd3pzMXVCSVFQaHV1UDhhLzRZNTN1aEtLSUpaZVVVclpnVFhjbmdRaHVW?=
 =?utf-8?B?UUI5MTBPWEN4cFFCNUpxdjNPK3owSjNiWlFoaWdGRGVyUlZkZ2t2aVRKdmFV?=
 =?utf-8?B?WXJhclFrRkFIUXlkakl5UENXZ05iMEtSMW14dm4vRnAxVm0xcjJTWVJJN1hS?=
 =?utf-8?B?K1N1TUo3M2dDSVl4MUx3ZW0wb1p2SVpPUlpIVTQzQ1dkNDI4Z0ZweVFaUTBN?=
 =?utf-8?B?WEl5V2QzUXpIb1VtYXVkTHpSMzI2QUFRU1F4bzFYVEwyWDdKOGJtMlo1cXpl?=
 =?utf-8?B?MkE3bFlkZTAwTklaS3AxZTBVZHpvRk9aN3VHcTIvOC9BN0pzNHk0SlRncE9C?=
 =?utf-8?B?MVNreTh4VGcwaks2MnAxbGUyaWs4dWRjKzdDMzJmR0dxd1A0TnRqSHkvdFZL?=
 =?utf-8?B?NE5PZTd3TWlCRWpQY1pISnMvSEVEazlWNEFUNjZFSTZiUG9hZjFSbFdjME5x?=
 =?utf-8?B?K3YrL29lblFVSDZxZzZiZVlkNVpHd2xVaXpiVE8yVVNIakRtN3BQQ3I2RENE?=
 =?utf-8?B?MmRzYnRnSlo1OXJ2TzM2em1rYnYvamJTek55S3Iwc3lnbi9MUXlramtIbS83?=
 =?utf-8?B?eXMwM21xbkNieVlLeHVwWWdwNS9RdFoyZjFoWHhUK3hrNjNxUEYvb0dpRzgz?=
 =?utf-8?B?bjluZkJKdllvcFhXenJiR2dTdUdNckxJMjVaa3pTbDNmc2JDbnJzUWp2RjdT?=
 =?utf-8?B?UXlOcDJ6dnk2eXNUcVU1Q2o5SXY2UlBuWXNMdTlkK1NES0txU0FFUmszVEJr?=
 =?utf-8?B?dFZDWTZUUGRLbE1IbkdEUklYZ25zOVFZd3NPS0l5ZmNFTzRZWHd2ZGxoNGlN?=
 =?utf-8?B?Q1pMcHBrRG1SNWdCOVhtS1pPQWhIZWdJNGNzYU9IOTQ0eDhwN3B1bUpRN2FT?=
 =?utf-8?B?NUR6YlZOTlBHTkV2VU9UNFFlNFVrOS93dnFxWUNhWmNxUHZRY0tDMzNGOUFY?=
 =?utf-8?B?cVNwZ0VoTDNJRkc1Q2FZalRkVk5jUlB2amI0N2UxdHFFS2xLcDBEZlQzUzZ3?=
 =?utf-8?B?SURSL1dQYWpNa09pZ05mVDlwVHJ1Tno1WjZtWHBzbWdVZXF6MG1BdEdFNnpj?=
 =?utf-8?B?VXZRYnpubkI4akNGblIwRmlqdnAxRUVzT2haaWxOc29HVjFDRDF6Mm9WR2Jl?=
 =?utf-8?B?UFRxTFB0UVdoRXkyMmU2cHQ1VWY0V0JoOWUyZ2Q1bTJDSTk3TGlLWmo2bklt?=
 =?utf-8?B?Mlh4TTlIRW5QQ09SMkpnVVNDQXZxZksyY2lDWXhkNlNjWGNtS0JmeVRHVjAr?=
 =?utf-8?B?NGw3Z1NySjhoR25Hem8wSDlvdkVPZVpuUXhLVjA3NmJRamdoOTRjUkY0VERh?=
 =?utf-8?B?U0VXZzJqbG53YlVvdnlQcUkwYjBBRXdHaEpaWDczU2V4UVFjaEJIajJSeVA1?=
 =?utf-8?B?cTRraFF2ZCttMkNRbzU4QlBJcXhnYXVtekJFeE1aOFA5Wk90cnhHaUpmUzZO?=
 =?utf-8?B?VUZsQXJicnhqWjB2OE1ONUt0c2xEUCtyZ3BYM1lnN1c2T1pweEhnQ0ZvRXpr?=
 =?utf-8?B?cDlJUzIycURWQnk1QnhFcHN6dzNLUVBnOEVGcEVpSXI5bmc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Wm9mbVRCZkxmQ0NxcW44SGJRdVpTMVkwKytaaWFodktZTjFIeGZ1SW1veW9R?=
 =?utf-8?B?YnI5QVJkRFV4Z0pqZnd1MnBkRi9OY1ZHZUw5TGJFZE1qQlNHWFNPV256akdi?=
 =?utf-8?B?Nm9xZ1hqVzBjMHFiOU96UUNCeWtacVhWb0lYR2F1c1NmUlNKRXBJK2RLTjg5?=
 =?utf-8?B?RVdraUIyL1BkVDE3TFlodXJJVjBoNkdVdFJBNlQ2T2lmazdmN0dDSCt2RzZG?=
 =?utf-8?B?WFJDM0FWRnpBcEN4cWFROStWanZIcTdNcU1kOG5OTG5WTzB5cFhMVHRlUnFD?=
 =?utf-8?B?TGwycUUzcERJZ0V4eXg4Lys1MjVLTnVockxxdDVmVzlaWFIzNy9acDIwZmdV?=
 =?utf-8?B?ZTNJMmp4WTA2cStvcnhQSkZlVERmSE1ycnVPVFBHK0RQa1Y1anNsWmdyNXFp?=
 =?utf-8?B?U3JzNjJKRjlaaTVQc1VEVzlnSE5mMTg2Rm9qTDY3MVZaZldZSFU4NWhWdDVZ?=
 =?utf-8?B?eXVUOEdxYy83QUd5ZGJJNXRaek1WMWFjQ1hnaGQ2M3hXRDdGVFVRRm0zK2l6?=
 =?utf-8?B?cDBzRUFENHBUVU11c3pEOXV3VzdzaDZEWFF3U1JvckRGYXVHV0JxWVpZa2Qw?=
 =?utf-8?B?ZUFZSXM0YTZETGZ5SXhOMDlBOUwrUW1WZzNRdmpxV3dJLzJDQ0dKY044RnEx?=
 =?utf-8?B?SzlKUGsyaHlhcVU5MUlJRjJJd2tpL2ZCVDhlS21QVUFDR1F3YkMyUStubzlY?=
 =?utf-8?B?U1Urb1FtanEvY2N5R3A1dHpyKzVOam5NS1JmaVA1VDRDOFFZTzF1YXN0dUR5?=
 =?utf-8?B?RmliZE5DMDhwemFZdHcyOFRzMGs0czhscW5xOHZuZ1Q0RlYvRm4vYlVvRXNa?=
 =?utf-8?B?L1dZQ3prbTJPY1U3ZSthREtwTUVXdThuSVgvNnYrSmEyZGY2dnhJS1RJaTV6?=
 =?utf-8?B?R0N3SHMxVFJGTkNkWDZFMDhLSUpUVXE5U2ZzNGIyNG9VVy9peW9QeHBDcWox?=
 =?utf-8?B?N1FEdC9KWXFDL2RxQWpEUExWN0kyTjEvcFpXU3JuSWFyVEwrL0dXdFFyMWU1?=
 =?utf-8?B?YlFXZnN1Y0pNRmtLdi8wTVdGT2JwY3hlK3plZE1RMVV4ZmkrY0hsNlU3Zm1E?=
 =?utf-8?B?RFVGU3QycFdaVUlxWHVwcFM4NDJscDNZZ25MRmZhd3QvRWZzMzN6NnJNa080?=
 =?utf-8?B?bXpaYlhjNklkRS9xOVlHQklFc2xDL2tpMGkxdHM2NmFOdkJkZjkyNlo2S096?=
 =?utf-8?B?Z2xjQUdlVERhNFF0eHJtRVBBRVBzRXJRcmRnVk5iZjd4S0NqaGdPZEs1VXk0?=
 =?utf-8?B?SlZiL2RVa3kxdzVMZ2lWRC9xNDliTVYxUUdJV294R0ZrT3JCRHFKR2FDUmk2?=
 =?utf-8?B?dHB4eHJHN1ZXT2YxK09JQWVmZzlUaUFDRDZUK2FJS1c4V1g5Q21WeXB3NWRx?=
 =?utf-8?B?U1F2TTJSK29Mcnkvd2pOTzNldGNaYk9BNHFsSDZuSG12LzIwM0Z5cjZONVlE?=
 =?utf-8?B?K0xuZWIrZkVGMGRyN0RZZDY4aHU1VXVyWjRsT2RZU1BSTkJmM0ZtQ0dXZVBZ?=
 =?utf-8?B?K2twejNXaFdBVmNTVnZIZXhLRDUvV2xGY3pkK3EyZEMyQTRBRUtNK0dxZml3?=
 =?utf-8?B?QUE1UnhVQ3JWQnRoR3ZEbkRvc3F6ZHprQlBzUVo1RXJwZXpqbWFaUDBlcmZF?=
 =?utf-8?B?dVVZMkRjRXdJWk5TYzlybGNkMy9zei9JS0JNY2tVZlNXdk1CNnM3QmZhV3p4?=
 =?utf-8?B?MndQakt4TzBqTGRtQWFpL01KOTlKbzR1bVM4RFdoL3pIaGlqZUNQOUNsL0xV?=
 =?utf-8?B?ZHoxU28wZ1JoSVJScUtLMkpUYjFqSWFZcUlVdWNIdHV0UzlDdVdjRXMrN05u?=
 =?utf-8?B?ZTFDK3NiSkhxSlhhbnRnOFlmdEk2b2FRWWtaQ29YUFgzZkRab2ZrcTM2T1NU?=
 =?utf-8?B?SHFSVC9hRi9Pb0tOa3oyOS9QSXF4QzhDTWtWeVVqdVNjMkVaZnMxaWpxbDB1?=
 =?utf-8?B?SzVLQnppRldVSEc3VjRDRGNrdUxraGV4NHVoY0ltNndnNnk1cytrK3hJZnRE?=
 =?utf-8?B?QWMzSVZ3L0srQnhrWlcwb2prcFJ0bXFFMERLeXhMWFZ1Mk5jR2ZnLzg5TDZW?=
 =?utf-8?B?MkROQ2VZUmtQSDRuaGZhTlFWanZuL1NVSVdrbjRqZjllMThEREh4UE5sV1VV?=
 =?utf-8?B?QmZGcHBack9EY1Y3eVNGQU5XUjdBVDhteXQ4UVhFVlZNMWw0N3IwSkNXbHJJ?=
 =?utf-8?B?V3Z0blVmUjN2akswSEdtT29SblBVS3UwbnIwUE9xTHZVRUNqZG9PRHN3YnFQ?=
 =?utf-8?B?Q1J2bmdJMWdMakdHU1M5T3F1L0FnVlcyRW1DZWhOQ2hTYnJNaldveWdKdFJD?=
 =?utf-8?B?d0ZXWEFoZmJKWm9PQ1IwVHA1S2dpc3o0QXVCK2pyditaVE5aTUp1Zz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: edf93622-3d7c-4056-e3e4-08de4dc9199f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 08:45:25.3098 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6O3tckDTg54rNKgzh8hVq9bffOA93bBasab84B/een0P/hcD9d+p4Y5GB4orobqZqj6Hx0foST5oA8OrVFUD1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6089
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



On 1/6/2026 10:18 PM, Soham Purkait wrote:
> Creating a new spinner during each pass was introducing unnecessary
> overhead, which could distort timing-sensitive measurements
> and increase error rates. The cumulative cost of repeated spinner
> initialization was impacting test accuracy and efficiency.
> 
> To address this, a single spinner instance is now reused and properly
> ended and reset between iterations. This approach reduces the overhead
> associated with repeated spinner creation, saving time across multiple
> passes by eliminating the cumulative time spent on spinner
> initialization (creation time × number of passes). As the spinner's active
> duration more accurately reflects actual engine busyness, this leads to
> more precise measurements of the percentage of engine busyness in terms
> of spinner running time.
> 
> With this change, the engine-activity-accuracy test results clearly show
> an improvement in error reduction ranging from 98.97% to 99.53%.
> 
> v1:
>   - Add how this patch improves the engine activity accuracy test. (Lucas)
>   - Show the numbers with the said improvement. (Lucas)
> 
> v2:
>   - Add an overview of the issue. (Riana)
>   - Add the links in Closes. (Riana)
>   - Add improvement in percentage. (Kamil)
> 
> v3:
>   - Add spin_sync_wait() with excess time adjusted
>     accordingly. (Riana)
> 
> Fixes: 477154cbad2c ("tests/intel/xe_pmu: Add tests to validate engine activity accuracy")
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/6251
> Signed-off-by: Soham Purkait <soham.purkait@intel.com>


Reviewed-by: Riana Tauro <riana.tauro@intel.com>

> ---
>   tests/intel/xe_pmu.c | 17 +++++++++++++----
>   1 file changed, 13 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
> index c8b3cebf0..33852270a 100644
> --- a/tests/intel/xe_pmu.c
> +++ b/tests/intel/xe_pmu.c
> @@ -534,6 +534,10 @@ static void accuracy(int fd, struct drm_xe_engine_class_instance *eci,
>   		intel_allocator_init();
>   		ahnd = intel_allocator_open(fd, 0, INTEL_ALLOCATOR_RELOC);
>   
> +		spin = igt_spin_new(fd, .ahnd = ahnd, .vm = vm, .hwe = eci);
> +		xe_spin_end(spin->xe_spin);
> +		xe_spin_sync_wait(fd, spin);
> +
>   		for (int pass = 0; pass < ARRAY_SIZE(timeout); pass++) {
>   			unsigned int target_idle_us = idle_us;
>   			struct timespec start = { };
> @@ -546,21 +550,25 @@ static void accuracy(int fd, struct drm_xe_engine_class_instance *eci,
>   
>   			while (pass_ns < timeout[pass]) {
>   				unsigned long loop_ns, loop_active_ns, loop_idle_ns, now;
> +				unsigned long after_sync;
>   				double err, prev_avg, cur_val;
>   
>   				/* idle sleep */
>   				igt_measured_usleep(target_idle_us);
>   
>   				/* start spinner */
> -				spin = igt_spin_new(fd, .ahnd = ahnd, .vm = vm, .hwe = eci);
> +				xe_spin_reset(fd, spin);
>   				loop_idle_ns = igt_nsec_elapsed(&start);
>   				igt_measured_usleep(active_us);
> -				igt_spin_free(fd, spin);
> +				xe_spin_end(spin->xe_spin);
>   
>   				now = igt_nsec_elapsed(&start);
> +				xe_spin_sync_wait(fd, spin);
> +				after_sync = igt_nsec_elapsed(&start);
> +
>   				loop_active_ns = now - loop_idle_ns;
>   				loop_ns = now - pass_ns;
> -				pass_ns = now;
> +				pass_ns = after_sync;
>   
>   				pass_active_ns += loop_active_ns;
>   				total_active_ns += loop_active_ns;
> @@ -590,6 +598,7 @@ static void accuracy(int fd, struct drm_xe_engine_class_instance *eci,
>   				      sizeof(expected));
>   		}
>   
> +		igt_spin_free(fd, spin);
>   		xe_vm_destroy(fd, vm);
>   		put_ahnd(ahnd);
>   	}
> @@ -622,7 +631,7 @@ static void accuracy(int fd, struct drm_xe_engine_class_instance *eci,
>   	igt_info("error=%.2f%% (%.2f%% vs %.2f%%)\n",
>   		 (engine_activity - expected) * 100, 100 * engine_activity, 100 * expected);
>   
> -	assert_within(100.0 * engine_activity, 100.0 * expected, 3);
> +	assert_within(100.0 * engine_activity, 100.0 * expected, 2);
>   }
>   
>   static void engine_activity_all_fn(int fd, struct drm_xe_engine_class_instance *eci, int num_fns)

