Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 230EAD4415D
	for <igt-dev@archiver.kernel.org>; Fri, 12 Dec 2025 09:33:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA7CE10E59C;
	Fri, 12 Dec 2025 09:33:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WOWbcab3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 112EB10E59C
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Dec 2025 09:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765532013; x=1797068013;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=YkEpP0m7NW8wKu1JuFqaZrBLEymxfMcCxGaFDF3FvPA=;
 b=WOWbcab3aZ/Lt/KlgPpW8cKUWZFFSQNChDNxOns7xm1RHwTy7FMO04Ad
 lIdU315jZyI0geh23htvVsjiIVDbTuD8hwElXB2C+2N1m9wHKH/ZB8/KX
 IBucRjY+w59NZpXBl+oWDpCoNjb5xgHrEGItbrQocHJxA4b6Rx3tDZ56r
 /hvMudaVUMixxzDjLP4X8zaEXpL28ymwhGFPmnowMsvh3mpMW3U8pZ+LY
 4f4gSMUwSJS/RXcpW/dlXopg1/0MCJSZtmBa9YhtcT/kW9LR5m5CBwj03
 G6Q91iPr8JndSWWwA9v4GPU5LzQTKb1wms3J1Qsyr3+kxtJEln8ipwNbZ g==;
X-CSE-ConnectionGUID: KHRnf9N/SO60dIx4JxT+9g==
X-CSE-MsgGUID: FlcbhGTaTqmf1g7DqqVd0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="67689313"
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; d="scan'208";a="67689313"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 01:33:33 -0800
X-CSE-ConnectionGUID: ii9/aWqzSYOVvZlDe82b3g==
X-CSE-MsgGUID: RBWwqpjYTpuXFtamYnOb7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; d="scan'208";a="196123207"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 01:33:31 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 12 Dec 2025 01:33:30 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 12 Dec 2025 01:33:30 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.36) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 12 Dec 2025 01:33:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pc5DGXk594Fea+qoiMPtyp5hn9ssGfg0wgC2uPnvPooZnA69gKZ3l/+N2ZJHjfQtWK7zSF4UM58lVrqCk8TqQdwwfDl6EwVIcJE/EPOXRkmm1zodMc905Fl1tZtC4651c5KCVz/G7/V02MXGEZuigtlM+DoUXIJiacWYCNeQkQdr79FNtjb0zt7i03vOUOw1/s01GoMv7Zd5ey2ADjzq4h4pBRGqOhL85QkYLuyoiEy3scxxa8KUyPd/7XiMCEieSntPEdGv09xrfUygL5eeSF0HIZvC8kMZyjCjU+xTeA1LwjPyuyZiiH5b5qcDqkSW/kzXhfQY8Zq43XYJasc8WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lMlaNQ54ydLq736tHBqyPm7cn22zVswwC3bo/3iS+z4=;
 b=P6vOAl+UJRGs4YdV3ZeDYbQjW2u+IgTKHVWCdkg57c1wXSDYd60+qmrtOzf52TkxNwZizwSjaEIxQ2U4MqidmmU322wr278dBA8dgNCx/GqgR7Bp5f9xD/kggU9oLzOuIlcE16FG8bZDedpNPn5TF6lq12D5CTriUJw/ZkqDpFb6hdvKi82cIuX65b9svKeja2EsvQIkVnAvUVocz1xMvD/Co0bWwd1gqPFGQHpbPaaeVyFWhVBLxHrMnq3m5pl5YF/g4Ytzmrb2mCERkXu7XffQLquInFOPwncavEv5Jb4zPQD409uCX0b+xJ6ZEuN9lnOauiNxtpoDSbxy3RhCOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by CY5PR11MB6140.namprd11.prod.outlook.com (2603:10b6:930:28::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.10; Fri, 12 Dec
 2025 09:33:22 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%4]) with mapi id 15.20.9412.005; Fri, 12 Dec 2025
 09:33:22 +0000
Message-ID: <73647cfa-383d-4868-b1cd-9700ae9cca47@intel.com>
Date: Fri, 12 Dec 2025 15:03:17 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/4] lib/igt_fb: Add wrappers for painting test
 patterns to framebuffers
To: "B, Jeevan" <jeevan.b@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: Kamil Konieczny <kamil.konieczny@linux.intel.com>
References: <20251210032349.2781106-1-karthik.b.s@intel.com>
 <20251210032349.2781106-2-karthik.b.s@intel.com>
 <DM4PR11MB63125FA2DDF7E617D94ED2E490A0A@DM4PR11MB6312.namprd11.prod.outlook.com>
 <DM4PR11MB6312A8D055114CD8EE0FAED790AEA@DM4PR11MB6312.namprd11.prod.outlook.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <DM4PR11MB6312A8D055114CD8EE0FAED790AEA@DM4PR11MB6312.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0097.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a8::15) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|CY5PR11MB6140:EE_
X-MS-Office365-Filtering-Correlation-Id: 99838d25-5dc1-4559-b453-08de39617e29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|42112799006|376014|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dFlCN2U5a0xhaVorZHRxaGNZSXhyYytFWXI1SDVMV1MySGdUamtUeXJqeWU0?=
 =?utf-8?B?Qzluc1FjSGt3UHNFWGg5V2srWmpUR1J1b3pTVE9KRHhIUmtIMVZIQXdHUkkv?=
 =?utf-8?B?TGxmTks2b3J1dkNLTUZyM1V1SlhzZFpyc2xHL1ZOai91YzhrTmNXOVc5SURE?=
 =?utf-8?B?NmplVDUvYk15MXNjT3R6VjIzb2IxZU55emViRURQYVZYVkhwbnlSQVoxSmFK?=
 =?utf-8?B?L3gvcndXaGpOaVl1Z0Eyem9sWlk0M0pIN2RBK293aUN2ZFcwaXZpaEF0OEMy?=
 =?utf-8?B?UUtUSE96dzA0UGVSL3NLRUtXb1lFdzI3ZTR6VjNuTzFXTkJndytqRm1ZbmJX?=
 =?utf-8?B?S3VSdUZNMVkyV3dhZ043ZFl5eUt3TzZCQTRGTi9TREl5Mm9yUDVYRDlmRkNQ?=
 =?utf-8?B?RmdmSC9DRzllUXRLRzhLSXZadEl6d25pT0EvWEdJYmhTNFJoM1FabWRWOHhN?=
 =?utf-8?B?UE5leS9XcmozOVdiUDRIamNyZGNINXF4eE0xUnJVY216VmM2S1l0RlBUaXRF?=
 =?utf-8?B?WUF5VVl5RUZKSGloai9jNFNpRS80WTZramlySmw3djlBRnA5ZDdNK2kwbkZv?=
 =?utf-8?B?cGRoTHp3dSsyc2pNQXRacHJMZXZNTmN2THZhbksyanNJdzh1NFl6QktHdVpi?=
 =?utf-8?B?Ly91VThmSm5BVU1kMHZReXRRRWcyZHNqV3NqMW1aeFlmTDNiMEptRUY4N05K?=
 =?utf-8?B?WG01L3ROMFJPemVVNDZuODRHZUlaWVdUdjRsUU5qS3l3b3pkVmJwcmFKeHQy?=
 =?utf-8?B?aEFvaTlvMDlLSnMyaVNOeEEvbmE3bGY0THlnSVQwOS8wZ1JQc2x4L1Vsa0NM?=
 =?utf-8?B?Y1lzOVJWRFNiOHVlblRSOG1aTnVaQnhua0FrTlFDdDY3dkRINVcyUzFGdEhJ?=
 =?utf-8?B?aU1SalFnUU0xTzlmTmtXVWR0QkR4eDZnT1lpZ0xYZDZydFNtcnFyd2hERlM1?=
 =?utf-8?B?Tko2YXRRanZtcGV4c1N5T0QrSndBelFvV0ZTMVhwUFZEb2NlYnpLUS9ZZEg4?=
 =?utf-8?B?WCtFeTZDRGxRdHFIcFBkRnlRV0dTckEvUllRNmR2R3U5eSs4QlAyZXRGanlM?=
 =?utf-8?B?MnNoUmEwbVBGOUx1MXpHY1hWYzJQakZFSVEyVEdNcjdlWGFRMWdRaHdrT2x5?=
 =?utf-8?B?MUFUcmJ3MWVtSnR3aTc4SDNaaHNoZ0FvN1h0aWl6bjVTU0kzbXBzWTllZGlw?=
 =?utf-8?B?RXo0U3A5QUl0VlVrSjVIS2twQnlJUnFhWnMxYjduMGI2QWdMVi92TmdEOTQ3?=
 =?utf-8?B?OXZKQ0ovZWZUOGdwRUNmYnk0QVRWa3IwVHRsWjVWMlVZSVkvK1dXbkpIRnpU?=
 =?utf-8?B?VTJyRXBtUVVUNUwwdTdVTUl2a0s4QVlRZ1laS3VyZWNoNUFzck9kc0MwZmhV?=
 =?utf-8?B?T0hjZ2ZDbVFGUFhlQmhuaVpWdjB4emlmY3czaWJWRWJ1YXA0YkVPV2UwVEJ6?=
 =?utf-8?B?R0UvdlhyeTA1NUhSWkd4Y0FKUmM1ditDWVc4cVhWRUNDbVpGcW8vS09Sb0h0?=
 =?utf-8?B?SURKRUVNV3B4aUhQUk5CMCtKRjVMTFJ3b05iV2lzOE5YeVJHd3ZaRUdZZHdK?=
 =?utf-8?B?QU50eHhGNGZ2bVJ5YVJ5Umt6RWkvSWRtelc5S0FsZlM2cldtdVdaejArZUs4?=
 =?utf-8?B?NDZyYU93blRhVkhmYjltMXRkOVB4bWdORVJJMlJ3SHlHOHJsMWxpa1E3T0lL?=
 =?utf-8?B?ZUNCWFRaS3pMbmlDaFJ0UWVWald3emF1V2RyeVhkbkU0RlNaS0tHSStQSXQx?=
 =?utf-8?B?dENQVnBqUk9UVW5XcUNJQmxQbE1UdDRmcmwxY3NQditxTVd5cVVUdHdxNDhj?=
 =?utf-8?B?bUdmUVJ3TXZndkRRSlZ4Y0F5N25aN3BhRXNET2cwWjA5VExGa0x1aElPK3M4?=
 =?utf-8?B?RWxxbmpOQXdLdFRTa2FSYnNKL2tRTUtPMlRpM1RLNGdmV0g5cjlMWkhSZ25k?=
 =?utf-8?Q?JVnRAPp8pr8d5+Ld4Z1XlN8dvPJjwr7G?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(42112799006)(376014)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dWpUOWM5WTRqR3pPY05NSDI5dkl6b1phK3cyVDZZZ1VJOUcwaXRzZ2FaYVg5?=
 =?utf-8?B?MWRQMVRSNWszVHhzNVB3VElKZTRxZDlic1VlTURqQTE3ek9nRWFJL0FBNU1h?=
 =?utf-8?B?d2JkWGJjTnJSVW9RN1dvWnY5YXI0WGM1bzBGZktDeTJ6QjUwNXRXZmV0Lzdn?=
 =?utf-8?B?UzA1aldvZFFnM252NXpEV2lHSWE3ZmtwNDArTkpEWXd4bUhqOXQxS0plcjA4?=
 =?utf-8?B?WFdsRzg4NWdtVjhsMUlBUXFsMzdOc0w3L2JBTG5wM2tEZGpxbzNJYzFTSS83?=
 =?utf-8?B?S1NYcmtBYTlCOUdJajB6bW9KNk43b043eC9XOXAwSFFKU2pEWHVLTnBZZ2dy?=
 =?utf-8?B?NkxrbGNlNmJaQmRCRHJSZ1AweElRUlo3d0p2UzZqRzFTeCtpdjJmOWtwTXRS?=
 =?utf-8?B?OUNhdVVmN3V6Z0NQRlBBQmdsUDVxZ0gxNlJPTkVKeGIzSGJJQ0FKaWdkTjVk?=
 =?utf-8?B?dlF5c1FnSVF2NDBFbzJzOWR6c2R6Mmh5MzdFT29pcjZHRHZxQTdFdkwrc0Rq?=
 =?utf-8?B?TWs3dThPcjBIY1UxajFrNW1ITHg5Uzk2ZnI0RndiUFhkdEhrd1JRQjlocWFv?=
 =?utf-8?B?TkMzU3lQa21RS2hQY3Z3T3BOZmFLUEFsUXpnN09DalpBN1loNFh2MGtlQnlx?=
 =?utf-8?B?RzF2bUdaVlIxdXlGZm03Qm8zdHMvSFFZQ0RFak1XZ2w0UFNKcit4ekkrRTV2?=
 =?utf-8?B?VDkxeWEzVXpDRi9hTFJmaDBBNjFsMTlYN3dPQkZIVTNOTjU5YVhmSFVXZExi?=
 =?utf-8?B?MFVvbDZ1UnNZRHRIS1Fuc1B5eHNPeWFTb21hcUduazRmaWVlK3doR0FWejUz?=
 =?utf-8?B?ZTdHMGJmN1ZBdmJvSXhxQ3BsSXhPdVluUi96bVc4ZVJiY3pDd09kWTR6Zzkx?=
 =?utf-8?B?RzUySmY5OVBtWnEyV2dlQUh4NTg0UHoxS1pOVHlFYmczQ1NVU2txTTZydWZQ?=
 =?utf-8?B?WEwzQUp0anlRWVJlNFRCdVFxVkcxZjdEUXA4TUsyRG1xSFNtLzUxZlRqYUJ5?=
 =?utf-8?B?R1NjMk5mWUJKL3R6M0Z4RjA3U29NbTRRM3E5dVZDYTJKRmx1UDZwQVpsT3Yz?=
 =?utf-8?B?WCtpb0I3YnNJSnl3bFBvQnFKcVBZYzlEM2N6VjFQR3BxNDJPN1ljNzM3Q21P?=
 =?utf-8?B?dzFnV0VDbTFmMkhZZGpoYkwxaHpnR3B5bU5WWnBqYUFZWFdUS00zakRnaTQy?=
 =?utf-8?B?TFRFWXBDdkdHeTdEL25ZZmdBZUp4bk1NcXNacFltK1dKNGRvcnA1Szd5eHM2?=
 =?utf-8?B?YnoxVS90THFMaGxhaG05UnJBa083M0hyNGQwVEx6dlo5enhMY2FSVDFoaXdT?=
 =?utf-8?B?S3ZrbDNMd0NGdjB5M01aTzBrNktsbE5XV25XOENwcDZETTRTVTRRK2RrUlNr?=
 =?utf-8?B?ZVRSU3BHVFAwYWpydXJHdmRJbHhHNHJRWWZwNUtLMlYvd3hpa3g4MnJFWUpB?=
 =?utf-8?B?Mi80aXN4NTRHbVArY01MS0NyZ0kyOGlJT1pDNWZ5VzlzYldzRkUyYVhYb2NL?=
 =?utf-8?B?aUdhaVFwK0pBVzc2YVJtYjlPTEdMMUQ3M3AvRHMxTjhrdDBqMmptT0t0dldT?=
 =?utf-8?B?dzZjOU1hZUd0QnpBMGdoQXh0TVJSRkMzUmx2NHpVQXNSa1FnRHlnMVNzaWpo?=
 =?utf-8?B?dXJJRHpJeXp4R3Vwemk4SUJ0Qk5aay9NZ1dtVHZlVE9JMTZDc0ZTQzNsekxV?=
 =?utf-8?B?dnBSeHN3L0oyT1oxWGxRem1IaGRYYXZGVnl0c21PTEh2Q21QdFFwWDJoZlht?=
 =?utf-8?B?TzNqSytrdTJzckRhY1JMVXRYRjdDU0VzalpQYzNRTXp3S3hMM3YwMWY3NlhJ?=
 =?utf-8?B?eFJvK1U3MXFBbTZEZk01UFhmeHdVa3lMa2E5WEMvTU5JTkQvZnJXTFBLUEdV?=
 =?utf-8?B?bVM0MGI5WWludUF6UVdNM1ZNaFEvWWpKcmcrcHdmQ0JWOUNvL3FUTTR2OUI1?=
 =?utf-8?B?SGlhdjV0YnZCSzJUNzVQdWlGaEF6R0dlVW9DeElDVEhaRnludmsvaGkwUlV0?=
 =?utf-8?B?b0h6L0FJaGxCYlRHTVZGTFZBa1p4bUQ3TkVTcXNKVTUvMVFzcGdHQjZ6c3p4?=
 =?utf-8?B?ZEZtclRUcXJlOEZqMXVjMEdKN3BSUkczV1dkSFB2T1dSQm4rQTRiYjBuZ0My?=
 =?utf-8?B?S2h6ZGV2WlRtcjdhWXNoSjFjOVgwcVFPMEI5b0NScEViYnRIM29yenFYWko3?=
 =?utf-8?B?S1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 99838d25-5dc1-4559-b453-08de39617e29
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 09:33:22.5786 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9uujB31nk6Qh4sxgmOmrr9gj+OHmktKkqYXXPVw67JCgKQy9ti117Vy1eGqVAwUxsXgveCDBCF1eztRVCk4txA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6140
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

Hi Jeevan,

On 12/12/2025 2:44 PM, B, Jeevan wrote:
> With the suggested change.
>
> Reviewed-by: Jeevan B <jeevan.b@intel.com>

Thank for the rb, have sent rev2 with the documentation added.

Thanks and Regards,
Karthik.B.S
>
>> -----Original Message-----
>> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of B, Jeevan
>> Sent: Wednesday, December 10, 2025 9:05 AM
>> To: B S, Karthik <karthik.b.s@intel.com>; igt-dev@lists.freedesktop.org
>> Cc: B S, Karthik <karthik.b.s@intel.com>; Kamil Konieczny
>> <kamil.konieczny@linux.intel.com>
>> Subject: RE: [PATCH i-g-t 1/4] lib/igt_fb: Add wrappers for painting test patterns
>> to framebuffers
>>
>>> -----Original Message-----
>>> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
>>> Karthik B S
>>> Sent: Wednesday, December 10, 2025 8:54 AM
>>> To: igt-dev@lists.freedesktop.org
>>> Cc: B S, Karthik <karthik.b.s@intel.com>; Kamil Konieczny
>>> <kamil.konieczny@linux.intel.com>
>>> Subject: [PATCH i-g-t 1/4] lib/igt_fb: Add wrappers for painting test
>>> patterns to framebuffers
>>>
>>> Several tests manually create a cairo context, optionally fill a
>>> background color, paint the standard IGT test pattern, and then
>>> destroy the context. Add helper functions to wrap the igt cairo paint
>>> functions which can be used in test binaries to avoid code duplication and
>> improve readability.
>>> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>>> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
>>> ---
>>>   lib/igt_fb.c | 38 +++++++++++++++++++++++++++++---------
>>>   lib/igt_fb.h |  3 +++
>>>   2 files changed, 32 insertions(+), 9 deletions(-)
>>>
>>> diff --git a/lib/igt_fb.c b/lib/igt_fb.c index 0a8299d26..ef16fafb9
>>> 100644
>>> --- a/lib/igt_fb.c
>>> +++ b/lib/igt_fb.c
>>> @@ -2017,6 +2017,33 @@ void igt_paint_test_pattern(cairo_t *cr, int
>>> width, int height)
>>>   	igt_assert(!cairo_status(cr));
>>>   }
>>>
>> Please add documentation comments for all functions.
>> Apart from that patch looks good to me.
>>> +static void paint_test_pattern_fb_common(int fd, struct igt_fb *fb,
>>> +					 bool fill_bg,
>>> +					 double r, double g, double b)
>>> +{
>>> +	cairo_t *cr;
>>> +
>>> +	cr = igt_get_cairo_ctx(fd, fb);
>>> +
>>> +	if (fill_bg)
>>> +		igt_paint_color(cr, 0, 0, fb->width, fb->height, r, g, b);
>>> +
>>> +	igt_paint_test_pattern(cr, fb->width, fb->height);
>>> +
>>> +	igt_put_cairo_ctx(cr);
>>> +}
>>> +
>>> +void igt_paint_test_pattern_fb(int fd, struct igt_fb *fb) {
>>> +	paint_test_pattern_fb_common(fd, fb, false, 0, 0, 0); }
>>> +
>>> +void igt_paint_test_pattern_color_fb(int fd, struct igt_fb *fb,
>>> +				     double r, double g, double b) {
>>> +	paint_test_pattern_fb_common(fd, fb, true, r, g, b); }
>>> +
>>>   static cairo_status_t
>>>   stdio_read_func(void *closure, unsigned char* data, unsigned int
>>> size)  { @@
>>> -2277,14 +2304,11 @@ unsigned int igt_create_pattern_fb(int fd, int
>>> width, int height,
>>>   				   struct igt_fb *fb /* out */)
>>>   {
>>>   	unsigned int fb_id;
>>> -	cairo_t *cr;
>>>
>>>   	fb_id = igt_create_fb(fd, width, height, format, modifier, fb);
>>>   	igt_assert(fb_id);
>>>
>>> -	cr = igt_get_cairo_ctx(fd, fb);
>>> -	igt_paint_test_pattern(cr, width, height);
>>> -	igt_put_cairo_ctx(cr);
>>> +	igt_paint_test_pattern_fb(fd, fb);
>>>
>>>   	return fb_id;
>>>   }
>>> @@ -2319,15 +2343,11 @@ unsigned int igt_create_color_pattern_fb(int
>>> fd, int width, int height,
>>>   					 struct igt_fb *fb /* out */)
>>>   {
>>>   	unsigned int fb_id;
>>> -	cairo_t *cr;
>>>
>>>   	fb_id = igt_create_fb(fd, width, height, format, modifier, fb);
>>>   	igt_assert(fb_id);
>>>
>>> -	cr = igt_get_cairo_ctx(fd, fb);
>>> -	igt_paint_color(cr, 0, 0, width, height, r, g, b);
>>> -	igt_paint_test_pattern(cr, width, height);
>>> -	igt_put_cairo_ctx(cr);
>>> +	igt_paint_test_pattern_color_fb(fd, fb, r, g, b);
>>>
>>>   	return fb_id;
>>>   }
>>> diff --git a/lib/igt_fb.h b/lib/igt_fb.h index ac0e0909e..8e5907dab
>>> 100644
>>> --- a/lib/igt_fb.h
>>> +++ b/lib/igt_fb.h
>>> @@ -210,6 +210,9 @@ void igt_paint_color_gradient_range(cairo_t *cr,
>>> int x, int y, int w, int h,
>>>   				    double sr, double sg, double sb,
>>>   				    double er, double eg, double eb);  void
>>> igt_paint_test_pattern(cairo_t *cr, int width, int height);
>>> +void igt_paint_test_pattern_fb(int fd, struct igt_fb *fb); void
>>> +igt_paint_test_pattern_color_fb(int fd, struct igt_fb *fb,
>>> +				     double r, double g, double b);
>>>   void igt_paint_image(cairo_t *cr, const char *filename,
>>>   			 int dst_x, int dst_y, int dst_width, int dst_height);  int
>>> igt_cairo_printf_line(cairo_t *cr, enum igt_text_align align,
>>> --
>>> 2.43.0
