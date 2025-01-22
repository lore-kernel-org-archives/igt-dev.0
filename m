Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D0B2C02181
	for <igt-dev@archiver.kernel.org>; Wed, 22 Jan 2025 10:51:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1042110E228;
	Wed, 22 Jan 2025 10:51:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="drkkHi66";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 002BE10E228
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Jan 2025 10:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737543073; x=1769079073;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=CvJ8Tm9WTlFIkWBnVZu0LdjEIZP6V/AJOuJK4X27EZM=;
 b=drkkHi66rHNmjxP7OuzOGMAfrXjsv0gKNJ7kI3aKhA8O/nFcvf0faQ74
 DxDA9dXjDK93SPHf1SwSqEGXcllzt7beSE/ozu21Bx50etf7ktp/onBpm
 x2+uACiX4nWNDDai9Q+G59BpZzA6fUZZRsLgVh3gwJGZ9axZDJ58MqqA0
 ThVbnFa8sNuIoUnfAgr6Ka3HTPLq7JJH76L8E40P6JhYAuU2NxrFyi0BE
 NNS/7bdujT50Z5M12YEwjb6Q5ZuPqmIEMabH3wligSSwRXq1o5+LeDtuF
 7dSx+c37uDblhPqVvaQwP2c8N2UDGXtsaiMTisAoHKfdBf39yWdClNp6Y w==;
X-CSE-ConnectionGUID: n4Teo4m4SrihvemlU6a3sA==
X-CSE-MsgGUID: AUNZtzyoQHW3TXmJp32fTw==
X-IronPort-AV: E=McAfee;i="6700,10204,11322"; a="55542239"
X-IronPort-AV: E=Sophos;i="6.13,225,1732608000"; d="scan'208";a="55542239"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2025 02:51:12 -0800
X-CSE-ConnectionGUID: 9ueQAGWCSSu/uvBiZWCrNw==
X-CSE-MsgGUID: DgyFEAJzQDikxE1pjzSgow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,225,1732608000"; d="scan'208";a="106940479"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Jan 2025 02:51:12 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 22 Jan 2025 02:51:11 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 22 Jan 2025 02:51:11 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 22 Jan 2025 02:51:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VkbWPYBZZPYyonLSqaT8A8iW6Y8Jtnnv2ihH+ZLSDzkAbOJMphvQ/jQK+dFhlOazjswo4ugZ4vYgP2eNAc9QngKO1+ccuSdq6++jHP5WHmAGpJIIjF1V3N+1GLYHShvhMYm9gIAcZ0vPGKSR7PqklnVCsAP5RfjRaLQ7hRTjeutB4MPlk2vkgcBoUsfon3EG5sJj0IDygy0dg5tAdmEbsMKsW4UIisYLbLITrTkXSqeVM1Dur8CZIoTxZtns5bMyfNpwnJjOoPh+Q0swTmbsRZlR0QoxBXG6RKwonhmhA3Rkh9xWECrzIIfbol7i7VFTxQ28lnfcfnl1mk5MgFG+Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WawYFYrRwWj1x7AGJUQx4JGKrWSSOEARb5uLNekpKPQ=;
 b=VoqenwlyraI1Fxs2uARrpk9WLv4yin0dEtBoip2PIMY3a/89slSBnk0MSqBj7aHnFnpT48gXrauLTZMgGLNQRkQKLxl1amhbFwAUHbV19DsCJjnFON/PICN3t+xY6bAnLFhQQvEdgtCRTREZCnKYtGKkl8Uj9JTzL+c1kS+NAZ9H3kdobzh74nn5hUd940IFEnOJ3nr3IkJezekQcVi/sxEF75jECbM5A+XYomZ9kcGaNNCcrFJRWGNqrcFT1SSlk/1W3wRNiz3KqDVvZm8Y3K/kPNpWcRTvPRn8npxVpkcsMdrfaAXZB+XxjEit2/aCu5tCOevWV8s5iSfegTHdwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by MN0PR11MB5961.namprd11.prod.outlook.com (2603:10b6:208:381::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.22; Wed, 22 Jan
 2025 10:50:55 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%5]) with mapi id 15.20.8356.020; Wed, 22 Jan 2025
 10:50:55 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250121225733.808978-2-lucas.demarchi@intel.com>
References: <20250121225733.808978-1-lucas.demarchi@intel.com>
 <20250121225733.808978-2-lucas.demarchi@intel.com>
Subject: Re: [PATCH i-g-t v2 1/7] runner/settings: Deduplicate cleanup
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: Peter Senna Tschudin <peter.senna@linux.intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Ryszard Knop <ryszard.knop@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>, <igt-dev@lists.freedesktop.org>
Date: Wed, 22 Jan 2025 07:50:49 -0300
Message-ID: <173754304942.5500.13428996844401248383@intel.com>
User-Agent: alot/0.12.dev27+gd21c920b07eb
X-ClientProxiedBy: MW4PR03CA0142.namprd03.prod.outlook.com
 (2603:10b6:303:8c::27) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|MN0PR11MB5961:EE_
X-MS-Office365-Filtering-Correlation-Id: 38224d6d-dacd-4902-c144-08dd3ad2a56e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cE1RMUdQSDE1VDZmNnArc1RJRC9NZDh6N0ROUHQ5L1lxZHZEcHIvNnlvUUNT?=
 =?utf-8?B?elVFYWtSb1REczg3bm0ybVhJYU5oYWdxeXJmUjVPWTVRZUt4RVBwVlhBTTMr?=
 =?utf-8?B?enQzQnBVbzZZRnlvdjdodGNKMXdPRUthK2lvQWNtenBCYXkzLzh1UWgrOTdl?=
 =?utf-8?B?V2dXRkUrUG5jUytHQXZ6YmFxMDJhRU44MWFpTmxnby9WdFh4N3JnMERJSjFM?=
 =?utf-8?B?M0hYVmJybWR6RDNiem1QU2VCM1A0dW5VcVpFVGVZWDZHbzlRWUpHb1diRDY1?=
 =?utf-8?B?MzRtazFGbGFqSTRTSWJsTlZWTys3Znl4NDc0Wk8wdk1HbHpqMStSYjVFUS9u?=
 =?utf-8?B?ckFOV1h6TFNVdi92cjlmaVFDdE40M1N5Y2JjL1VhbFVtQzJDenNhajNWTHVo?=
 =?utf-8?B?RGFzN25WdVE0cUZ6ODRHUEFYd2VLdkhFL2ZxWmxKZVlIQjNad3hHakpraDlx?=
 =?utf-8?B?Sk50a2h3MVpYN1k1QXVjM25TVkl6ZFI4ejR6c25RdGFYdlpWOCtDNjdZZ3Bm?=
 =?utf-8?B?dG45Q2ZLdEtSVk80aUpyMWNLZTd4WHEzZnVmRkFlV2ZYZDAvZnBnRm83Mklv?=
 =?utf-8?B?RmxVcEY1V1pSS2Jyc1h4RWMxNCtYSnBzbmdXM01waGxGR00rMHlrNzArTVpI?=
 =?utf-8?B?K3NKaXhVNFR6VDFENGNaN2ZlMCtER2xrWHZYT3JuU2gyWGJZbU1UMFRSY0pL?=
 =?utf-8?B?RHhFMXBabVhqR1NHdGpoWWpFbVNHdDhENFJST3htNVhheEhGV1pSdG4rcmVz?=
 =?utf-8?B?R3BzYjBod25qS3dZQnZjS1RWdGlPa3NHeCs2RjZPWkdpc3czc1B3OEc1OFo3?=
 =?utf-8?B?L3R2R3Q0ZzMrbTRIMWhuaC81WjdLbjNRQzJkbndFcmY3QnYwNVpHdTVWdEVq?=
 =?utf-8?B?RWVvYUpLL2xzeFh0Yy9Xcy9ZV2FLRWowL3pkQUtKTFlSclE4amhEMWhPWGVs?=
 =?utf-8?B?aWxDRjFiR3grZGV2dFN1RVlEdEpZV3FranlwRVhwbVNxd29qS1pJMXVhZmZL?=
 =?utf-8?B?K3FpcnBCblpXMHhDQzBJc000YjRnSC8vVzg3Z2c3OWdoaE1zbExhNzcwV21i?=
 =?utf-8?B?dU0rbFV4QmRvYmJ6a2hWN2hyRk4vNFpacDg0N09XYzVqdXA1cVF6alRmcHpr?=
 =?utf-8?B?a2xJVC9hWnN6b3o4cjNlYW1yU2hrR0ovMnpkNEJ3VkNISVNzajE2MG0waTE5?=
 =?utf-8?B?SlNNU0NjWGNoK29kQnBkZUQrQU53Y1dmNE5ncG5JK0ExTHhpdVdpOXliL0tP?=
 =?utf-8?B?YXlQU2szcmpBSGFObndyUENZa2EybUI5b0ZwNGxFdGxoUWRsVXZ4V09Ta1Ux?=
 =?utf-8?B?OS9yalMwdVVYRXlUUjRJV3diN1BUUVZFZTQ0eUFWL2t4VTZuS3pub2ZXZUpv?=
 =?utf-8?B?TDQ3WXBwYjZ0dXBrNG5zcG9uK3dkcU50eGhvWjREaXJqTWl6c1VFWGxrUGlZ?=
 =?utf-8?B?SURVQXFUL3o5M0E5aWNpNmJMaC9hS2xpQ05JemJtOEdVL3A2YitEYVBkQ3Bt?=
 =?utf-8?B?cXk4ZkM4Ky9kV0JRUTQxQzhWdTdPdkFCL3Q2ZUNvYmJnSnRkUjRCVTR5Tnlj?=
 =?utf-8?B?Z0cwdGVhMlpWaGFlK29yQUpDYVNDOW96bG9iN2o3UHJyT3BFWlpqb3RoR3o2?=
 =?utf-8?B?Z3p5ck5IeGs1bFBhbjlHWG5uNElVSlQzM3VEaERiVnBUWGRKczhtWVQ3eGp0?=
 =?utf-8?B?dU5HQ2pZVUMvbWkvKzlyRWtMbytaU2JjMStDMjJRaU1MTkFDWG43VjhieWFo?=
 =?utf-8?B?SEk2aWQrclRSRDNLSEd2bDh2ekhUUzZNdVhPRUk3K2dmUWF3YzVmUkpnNkRF?=
 =?utf-8?B?ZTM2bGR3bHdweGI5R3Nxdkl2Q3lTRGEzajBqd09vYWR5Wm13Z3hnWGQ0eUxK?=
 =?utf-8?Q?l3nLKkArVrsza?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RytQclllSWVpYjRTVFQrSmFvMDdQSjRzZ21VaUE5WGxaVG9scUZia3RqU1Yz?=
 =?utf-8?B?Q01Vb0owOWdSdnhJQVBBNnU5TEdpcndna05GK1FpSVlMVFNEWjJoNTdMR09l?=
 =?utf-8?B?a0tyQ0NqN0hFWHc5Ynd2NWJuVEhWdnBtRmlIUzVSdWM5SjY4T3dSWFVjbjYz?=
 =?utf-8?B?WWRLVXEyRVpRSkJoTTREQ0V3bk5nemFaVk1HUFFZa1ZDL0Q2bXpQaTdSaDlU?=
 =?utf-8?B?WlRtMjRwckJvdnVpYjRtSFBPa3Z6cS9HZ2E3aGJCWDNkNDZhSlhHWjlwL1Uw?=
 =?utf-8?B?R2tUKzkwSXd4d09aZTRtMnduaWVsVitDNVVHNlQwb1pRU2V0a1JCRDB2aUZC?=
 =?utf-8?B?T01VUGUwZlZ0YU5CUWpxeHlFRFZwdndTM2ZvSS9jMDA1YVhIZ0FpdjdpS2ht?=
 =?utf-8?B?UTBJR2poV1lkSTJrSG1uVXpIMVlQTDZOclQvdmNOUVMrd3ZtdWx4clRFWDFr?=
 =?utf-8?B?NWk5MXpOZE5oRGVSMEl4QlNzb041d1k0RWYvKzlBT1kxUmdzR2NmMzFYN2FR?=
 =?utf-8?B?MmtwdHZCUWNySzVCQTFzUUhINXFyTzhsNHJxZTVITVdhdjBXSWRMMkNiRk5H?=
 =?utf-8?B?NFZ4dm9lbVUwZWVtOTFXZG9ETjBWKzlvNDdjdmdoNzdhY2xCai9nRjlJL0F4?=
 =?utf-8?B?THROaVFobk9yY3RkNWNmUzI3TmFVbUpJQ0p0SXVyamNoRTJ2MHJ3K3FFTFRY?=
 =?utf-8?B?VnBYQzhwaTVlbVN4YTZwNGFJWXlkUlVkZmtvNnZSR25Rc2xSWEZKQkk3SHlC?=
 =?utf-8?B?MDJkdVBoWHQ4WkhmckVhOGhPTnpNWURMbjNXSGRhcTFrYXpvWGxXVGExeDJH?=
 =?utf-8?B?Y3JvcEw0QVRpOC85QldkdVNtMWNrcjE1ZnUxQUJlNXVhVTZ4YzdHeFkxUnlP?=
 =?utf-8?B?bis3ZVJRWlpqalhCVkJlV21ZT01IVERDZWRsV2tCVm5sQ1Q2OUhDNG5iZEpy?=
 =?utf-8?B?MFlxUnRHTXlLZTZURk9GdVRNZklVREVVSUJMeTEvRVB3NEpxdkhFbEFpQkdV?=
 =?utf-8?B?UFRUSU5hQ3pxVkNqUTIyNm9BUUJkT0FkcEFscEgwSGt1NEdyaUd2ZFNaczBU?=
 =?utf-8?B?OWJDVUhrclRNbTM2alQ0VndobjcxaFVId3dhV3Z4c0E3SUhVV0pQLzFQUUJa?=
 =?utf-8?B?YjRETXl2T1pGeEU3TkdUMXJoM1dXemZZMVlBVVJXRzJqaXVCUnYzNi9xS0dZ?=
 =?utf-8?B?NGRNb2tkWG5nNTdjTi9ub0Nwc1R1dnM1Qk1ibTZoU0lTbStiNDhHWmJRaDFN?=
 =?utf-8?B?dTJ6UGdETlQ0NUpkeDZBR0lGb1UzUlZEaVRFbjJxdDNMY2M0bUU2bys1UXRR?=
 =?utf-8?B?bmJtZWhqc1NoM2NEcDdPKzlYY2FnYU5xNVZTTkxnSVo4VzRhMUdISEwzZGw5?=
 =?utf-8?B?Snd4TGdDdTlwU3duS295TUgyZ3cwSGNTQTRVTm9aQmhIUGRkY25TY20wNUxh?=
 =?utf-8?B?TUdHNmR3N0pXTWFYeTJaaXVselF0VlpOaUtHaUtBN1NRaVFKMU5Tb2hkQjFk?=
 =?utf-8?B?TTlwQStOUmx5YklGQUNQRzdYaDd6UHFJRDA1UlZiOWdQZTJocUhUUEZ5NDJF?=
 =?utf-8?B?aGphdktuVStodnRKcjFFK0NvSUlOTTAxeVpXeWp3cGdsbUQwM1hhNDRFS0pU?=
 =?utf-8?B?Ni84eTFsZUd2c3dkRWtCU1plKzZNR1pLVGFlT2hWU1hEcFFHZG1IRjJNSHFo?=
 =?utf-8?B?YVFwRnhQYUY4VjhTZFVJZStLQ2lPZW5tcytZelB3czd1aE5BMWFhS1BRL3RR?=
 =?utf-8?B?UlljOEhQckRhL0NNY2t1YlVudUFtRUZkeE5BVndPRUl3RFRPZ2xNbnZjejJL?=
 =?utf-8?B?MGp0RnExNHhVWGxyOWR3anJYY2NWb2hBVHhGQ0FyNHZBbStVbEJwMTFqdHVP?=
 =?utf-8?B?cGxWRFhvN1cxbE5iRXYrT2VRTi9CRHRwVUpzbGtpdUlUWUdTQXdPVE5oQ0F0?=
 =?utf-8?B?R3orUXlzODJJdG9aNTVzQ2QxM0N4d3lhSmNLRVk1a0J4a0hJUWYwUjMxbXUr?=
 =?utf-8?B?dDNoVlM0SDlUcU4vRnRyRHJ2S3BCMTlGUWlVTGxRSTdoaUxVZkM5NWRSZXhQ?=
 =?utf-8?B?WEpYU0s0OFVvM2FmYU5NT1R3VXVpMXRtdjcvb0FudTBXeTc0Um12eEw0Rm9z?=
 =?utf-8?B?bjRQbmV3TjdKRVFpamhOSHJmUmVjbmRsRVU4dFp1NVFMdHExaWgzSXFVNXVa?=
 =?utf-8?B?WkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 38224d6d-dacd-4902-c144-08dd3ad2a56e
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2025 10:50:55.0969 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2Vr0TCg+oW7yJ1m90j/8V+KzZa6JNZmX7TWQZ7W7iz0TbBqOy2g6YksfirYCo/i2j6Mj9AmRHvRltVRdpjhX0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB5961
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

Quoting Lucas De Marchi (2025-01-21 19:57:27-03:00)
>Deduplicate cleanup so it's also easy to parse the line in a different
>way.
>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

>---
> runner/settings.c | 13 ++++++-------
> 1 file changed, 6 insertions(+), 7 deletions(-)
>
>diff --git a/runner/settings.c b/runner/settings.c
>index 92fd42ea6..80d95be5b 100644
>--- a/runner/settings.c
>+++ b/runner/settings.c
>@@ -1154,13 +1154,10 @@ bool serialize_settings(struct settings *settings)
>=20
> bool read_settings_from_file(struct settings *settings, FILE *f)
> {
>-#define PARSE_LINE(s, name, val, field, write) \
>-        if (!strcmp(name, #field)) {               \
>-                s->field =3D write;               \
>-                free(name);                       \
>-                free(val);                       \
>-                name =3D val =3D NULL;               \
>-                continue;                       \
>+#define PARSE_LINE(s, name, val, field, write)        \
>+        if (!strcmp(name, #field)) {                \
>+                s->field =3D write;                \
>+                goto cleanup;                        \
>         }
>=20
>         char *name =3D NULL, *val =3D NULL;
>@@ -1195,6 +1192,8 @@ bool read_settings_from_file(struct settings *settin=
gs, FILE *f)
>=20
>                 printf("Warning: Unknown field in settings file: %s =3D %=
s\n",
>                        name, val);
>+
>+cleanup:
>                 free(name);
>                 free(val);
>                 name =3D val =3D NULL;
>--=20
>2.48.0
>
