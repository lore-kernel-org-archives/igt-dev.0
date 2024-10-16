Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58A53D2F7C6
	for <igt-dev@archiver.kernel.org>; Wed, 16 Oct 2024 21:20:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 112AA10E15A;
	Wed, 16 Oct 2024 21:20:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KkNzqm+d";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A749110E15A
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Oct 2024 21:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729113633; x=1760649633;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=0qT/WTFH5LJKuH1EdwVAVQdghtAXHhTjZOnskNRAD6g=;
 b=KkNzqm+d6CmJlgGbZsD4nRjBrBTcelg+/Alr7+lj9rqNInWav/WjWQQ9
 G10UxRPuMzwmvZBTLWkFMeeprWzhdrDcBtZX3yuE5A35SuyDST0qAp6hD
 yBiYkVTe0bP4NzqNdEQhkt7mpSn+CcmXAjfueST/eP5piqBtV8Jn1QT2Q
 4w8nldhaGzI5e9GiNXYDVB1bBbyWkigUSrxLFpGtkI6LD6+CDUlX22RuK
 aH+S1seGk7vb2k279IE18wrQZ4H84xtLp76CG1Ph0EDoP9Iic0kB/9v3w
 dFr3HBJak2TtvV53mu+cDq2yAgRIFSH9XDZ9nuuYbRQIWxRwKzqM6vSb0 A==;
X-CSE-ConnectionGUID: RzoOBhamQqy//cgOLQb4tA==
X-CSE-MsgGUID: Y19zk1u0QKqwVSFxkICH8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28731907"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="28731907"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2024 14:20:33 -0700
X-CSE-ConnectionGUID: XxHaSwuRT0mkjnFjpyCPTQ==
X-CSE-MsgGUID: 24iEbFYgRwmET5GcpVZB6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,209,1725346800"; d="scan'208";a="82306404"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Oct 2024 14:20:32 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 16 Oct 2024 14:20:32 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 16 Oct 2024 14:20:32 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.171)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 16 Oct 2024 14:20:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=chlYl2tpTZoQsRKyChi4svK0H/My3wMW6LaxUOKm+X1VdNVQMxDUaokHTrKAjQ75NMjFp0FAXspv4EC+IBI2kj531BEprGnlUOGyOdR7kEGrggD6VqIsxaF1df8G6dQfTjrrvXY024oHdAqERhoYZwVKGMZH+tam9r6ZshNP3NETdiGg49AIaA7XQqxvacAe1yvvUz3GcODmpChvpOP8eFhtCvq90T2vYtE65OmtABwhJTsRMJprQpCf9jh/Pamf6/0jdYiIt3jLtuu3c9gWnvhyHKh+pLM0AONECLHSXiLynpInIcxp6/8kd7TWqjZ2NMMadaJ9pCJHzWpjyY5iyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bmW73DVCUP/KiEEXVag3htFEqLVfPXvizQzPLbI1fH4=;
 b=t3rTQ8vnHIkvnqjykvVm/QIOLNDjVoCsXm7LPoDau8xh9UGeAKTBbQM8J6h66mX8ZIFDc5nQ0Z4iXVK9l+ZuWBJnfbQUl676MoF4QBGgOF1RK5ffh4wQWKt0SIJ9FIY/PlUsAWhhlyICEa+uUs2KlKnycghKWDrD34Aw/a2Bo5Rv9SwMDIDRAwwt0XFezjDu1REKpGQxpjNudIHMKDF9mZZsWo9a+nKaMWTPelpkHHxFkFPMOIlrrkNd51faoXcCNFCAe7vhumcZwDxLqpbUW2wLWONRgp/GThbVvUkQsjHJk7JfO34LHyK6CTaQ+dTGMJ1wzuYsmEAjIYYYHbNuXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by MW4PR11MB6886.namprd11.prod.outlook.com (2603:10b6:303:224::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.17; Wed, 16 Oct
 2024 21:20:22 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%4]) with mapi id 15.20.8048.020; Wed, 16 Oct 2024
 21:20:22 +0000
Message-ID: <72afdfe4-8cad-4135-8b6b-5da5a9e65e36@intel.com>
Date: Wed, 16 Oct 2024 17:20:19 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 1/1] tests/intel/xe_exec_capture: Add
 xe_exec_capture test
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20241015153101.4114544-1-zhanjun.dong@intel.com>
 <20241015153101.4114544-2-zhanjun.dong@intel.com>
 <20241016141242.ngj73q6xseseqx6n@kamilkon-desk.igk.intel.com>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <20241016141242.ngj73q6xseseqx6n@kamilkon-desk.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0106.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::21) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|MW4PR11MB6886:EE_
X-MS-Office365-Filtering-Correlation-Id: 0351865c-e60a-44ba-bdbe-08dcee285835
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OCthdkw0eEgvaGZBWjI2bTYyOG9hMUVBVFVjTEFiVENLSzc2QjRFNmRmVWFN?=
 =?utf-8?B?ZWdQa0VFZ09ldTVPOXdjV3d3WEd5aXdkWFI2Q0ZZVDV4b1VGOWZnK0pKNXEz?=
 =?utf-8?B?TWxPQnZqSExkd0RGN0xXa3N2K0prTFlBSUk5S1dtd01FWEZhRXljblhia08x?=
 =?utf-8?B?ZDJxQ080NFN5cXJkSEU1cForNUhETmhVU1JnN1lkVERyOFRnajZkajhRdit6?=
 =?utf-8?B?NnJUQUx1a2IyYy8rREdhVHhEWmhlTkZVaUZXTlBvWUJwWVFUeTdRdU1uOVlO?=
 =?utf-8?B?UGFTSzVPZklIQWNRVFhoVDRqMXhnYmJ5dWdXUmRrV1VmYVRsWVJCK3ZGQ2E0?=
 =?utf-8?B?b0cxbWZtdXZ6OS82S2ZVQnJLZFpGZC9BcGhycXlZNG1HQmgveU0yY3RDYTJ5?=
 =?utf-8?B?dU1PY2JsRm5OR1pxb1B3YWtLWTBDVGtWNUxzcTlGSko5aW44T3hnR0UrWDlj?=
 =?utf-8?B?MVBjYThyWXYwcjlJL0JnclNNbUdWTjMyNWhCMEpVa2pqcHVET0pweDl5Uzda?=
 =?utf-8?B?TXRJdHMwckhUZVNGNll0UytwQmlMejRCZ01tOU0zdlNHdFUra3FqNkJKa01U?=
 =?utf-8?B?NzZWcHBNcFp1K1JNRmpWY2ZDRUhqTXdlUnVsSVhjYjVhMnZwYzVkc1ZoY0ov?=
 =?utf-8?B?YzRpa1ZlWUc5cGIxM2pZSG9jNVBlU1VvZVFneGlCWFRFajIwVndpV3A0aktn?=
 =?utf-8?B?SjFURnRGNVBIU0ZHYlN5VE9EdDdXYys4UG1QSFN6WC8zcTNOZmtvVHFxMU4v?=
 =?utf-8?B?cFV5YnZ1eFppN0U2OVovaXBoVlRoUmZkMUh3a29NaHRVTVVZd3Uyc0Exakh4?=
 =?utf-8?B?OWNmYXFQSE56THNldHhUVHlXaExCUUJZbFRlY01hTHZTNDI3d0ZsS1cwSU96?=
 =?utf-8?B?N21paVdDY3lDTkFWMVJzc1dnSHBvdi9MZkhXT3dSYWtCbDc4bUpjdFp0U2o2?=
 =?utf-8?B?eU5pM2YxRlpSK2lxclRiUTRONFlQSE5QSjlpNE9Kc3FzdFZvWm5QUDIzb241?=
 =?utf-8?B?d1BPWjhNOWlldkFFaTluZEVQd1Q5QzRKRUdFSG5YVmVsV1BwMjBOanBqMXFK?=
 =?utf-8?B?amk0MFJSRElMS1lUSVlJaFJBMTIyMGsrTDU4dTFseXNWbDdVMVZxU0J0OXhK?=
 =?utf-8?B?dVI3SEhVUzJTYWRuNkl6SDhwM2FWejJSclY2TTFQOTZqOUczNEs1Yk1iS0ly?=
 =?utf-8?B?VUQyN0Y4aURtQkU2bVVoUXI3Qy9ZbWZlTXMvSFFtbWIrenNiU1VPODF4TkZ0?=
 =?utf-8?B?Ym5yTVgzcjNwUGdtTCtFblpvRHBacUxsK01wakJ4NFVoNzcya1BPcERpQUtX?=
 =?utf-8?B?bXV2NWlEd3JIRnJURmhxaUkrTUp5K1h2MUxMa0MyY3pacXg5UEpac1F0WXF0?=
 =?utf-8?B?MjJDUGxHSENCdXQxV2xDdGdyL2lHcFM1N1FiOE1CNURMcllnK3lkYmdoenlI?=
 =?utf-8?B?SDA5aXJUVUt4R1hGb2ZqSVpQSHcvdjdlYkMxRThzQm5FVlpncHZVNytNV21l?=
 =?utf-8?B?SHhxOTR0V3R5V3ZiYjMyTjgrVVFNcDkvWHozNlEwb05hcFlNT1pyUU05dUxN?=
 =?utf-8?B?eXVtbHl6VStqOU9BSFFFWFVtN2VyK1hyTFJWWjA4c0ViRlQ1aGRQTXIxbnE4?=
 =?utf-8?B?aTBUV0x4aHJYTDAzazJ0NC9pODlQdDV4Um9jVVM5ZDVDa1FScm9HL00rQ1Ju?=
 =?utf-8?B?bThaNW54VGtBU1AwaGdobWxsVHQ5d1g4alREUU91bTJaS2xIZVZsZlcydzVX?=
 =?utf-8?Q?cs5LuiGpS4Mh23ZWztdXjCIa17MdTgxVQsLRz4o?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bEVvMTI1TWxPdlk2eUM3TXEwbERQekxkV2NJK0VzZXFSd3V2ajNrbUxrb2cy?=
 =?utf-8?B?ZW13VjdIcndmQ0h3RVd6czhpc3g0UXEvbDRUYnJiSUsrbnliWWhKcjN1bEpa?=
 =?utf-8?B?cGtLU2k0VEc5SWd0ekJCc1ZOdTZ5a3duNVV2b1BoMFRyc2dpZEtWTC83eVpT?=
 =?utf-8?B?OUJYdCtPaGdUdmNPSGNIQnNsOXJNZHdvMSt3VUdPUWdzcWFrQStHYU82ZzJ3?=
 =?utf-8?B?Y0lSRG5zd3MwOFRBblhWejhzTUkrNnl6cnM5RDRaaEplekIvQVBOZTdpNWJi?=
 =?utf-8?B?VFVSNHRnVll1Q3RxRDZTVmZneXBJRFBnZUx1dXBwUWFqMzFxdEdJUzV0WjVa?=
 =?utf-8?B?a3hyek5FT2IxU3JKdEV5cEhzaXc2SnZPRllwMWczckpmOHJnM3p5bVh3TlhY?=
 =?utf-8?B?aGg2dGU5ZUpYMHZoYWZVeTk5OS9PamJHQVpqYUlmaWpPM1VrRTFXcUpRUmNH?=
 =?utf-8?B?RnVPRWxkSEI1cDRkUDg3UVNRL1BBcm05UU82cGtQc2lRc0dtMTJGeTdJVStE?=
 =?utf-8?B?UTk1RUV0eXdSVXg1dnZwQy9HSkQ2dERKdWlZM2FRWFhRcHRXQnJuQjZQK1d2?=
 =?utf-8?B?UEJPUkRDdE5xOWNsWG5hSThOVGF4N0FkcTNJYmtyZUFEdnRuOUQ1bVF4KzhV?=
 =?utf-8?B?YkFNT214NW1XVmU4VWJtV2RYWnVPODFJeUR4aWhzRGEwNlkwY0xhUjlBYTlC?=
 =?utf-8?B?VFR3RlViaEdwbEhsaGlpd1dCbFBsM2JLS1FiNUw1UGJnR3YyZVRYS1FJNGkz?=
 =?utf-8?B?SSt1Q1NiZmNYTWxTbDNFbmwyZzZIdEZTbkxzcWVnSEVDcnMraGlSZlJkOUtp?=
 =?utf-8?B?cDZHTTQrS24vRHRNTFphMkxKWUVUaDRWSXA4U1hVVlJYY3lzYWliemIvUUVM?=
 =?utf-8?B?Uk5SZzFNOGNCY2tVNmRaWnRNT0ExTFpka3ZIQzJpK1llQlJ1b1pXVDFveHhO?=
 =?utf-8?B?c2I4K2FJRkwrelNxcHlPajlIYVBjL1htNDhXV0xwSFVOb0RYaFN2U0RBYmx6?=
 =?utf-8?B?d3ZSb0ZjeXBGMkZMUkdMdlhjcGtIQXArSmJ4SHltbmRWYVNTbHczMjV1R1ll?=
 =?utf-8?B?NjF1bkJpV04vWlJUTFRJYThxclBmOTN3UkQzRU1rdDA2cHBBOEpkMk5WcUhQ?=
 =?utf-8?B?d1pKbGwzRURmN2dLTnIzWkp0Rmp4Zndoa01xUHZLVWIzOHdxekh1S2QzWWVt?=
 =?utf-8?B?YzdDdHk0SksvcGVxMm1iNWFGMHRtQ0hnTlAxalRLdEQ1Q1VkcjBTZWsxN3kv?=
 =?utf-8?B?NHp4MWhvakVEREtXSG93T1kzWE9jNklGMlBTWkR2OHIrSHprTnlhQmZrdTRU?=
 =?utf-8?B?SXR2VVhQNUdmUVd1K1ZHblR4YVQ0OUd5NUk2ejRNMmZLekJVYlVQeEFLU2RQ?=
 =?utf-8?B?U1pCalp3VEFyZzA1cXU5NGsySXRnb201M082VlJIamxUWThuTlFwZ0dYckxL?=
 =?utf-8?B?blVQWnBxa0V5SVFtNTZxVGhrOFhZY3VCRk9OMzI5dzJ0cmQzdTFZUzF4ZTR1?=
 =?utf-8?B?VktneFppUUtkSHdmMHVzeC9YaGNmVk9OeDRYWWd2OTBQYUtxUG1heEdUQ3gv?=
 =?utf-8?B?Z1ltSTJVeFFGeUxHRFkxUHhTUFVxOFpmMVJqUExMSExrYnRRSElzWWwvMEZH?=
 =?utf-8?B?UkI2disvYmNKUHE2aGllVjRsclJzakF5azlhZzEvTVF3N3ZhNERpeGpoenZ5?=
 =?utf-8?B?Z3Z0SEpVWFNtM1dxaEtlaXFXNXdHTXJGblh1T3dNTlVCSzlFWWM3U1l2Wkth?=
 =?utf-8?B?bU0yeXF3ZXR2Z2NNYU43ejBGVi8vWE9yZXE2UHZOd0gyY3g2QmdNUDBPbldF?=
 =?utf-8?B?Y0dRQlRPVmhuL29xMHhtb2hJTmxnRWZzdERIKy9KVFNVb0w5T0xhWStSL0pT?=
 =?utf-8?B?aG1qZWs2cnp1QTNJZXJwbm5IaHJhM2Z5TENQZjQvY05EUWZNTmlmUG1BYisw?=
 =?utf-8?B?NWVTZ1dtd3ZiY29KUWFYVlVHSkZUdHZ2WlVUcmxIZkZFMW5QdW9QZlpqOXRY?=
 =?utf-8?B?Mk5GWENMZjUxeXcxQ242Qm5kcHc5U2wwcnBMTnNhZnU2cmNEUC9rVDI1UVV4?=
 =?utf-8?B?SytmSXB3c0tMckJMcjF2cXFEQS9kbUtpVDJsWmpYYjBSRFVPTHphR0QzS1hh?=
 =?utf-8?B?eFJOWWZCYnA0eTlmMVBud2Y3ZitPNWR3bFBGUVgzTTdER1EyN3E4WFZvZlNV?=
 =?utf-8?B?Mnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0351865c-e60a-44ba-bdbe-08dcee285835
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2024 21:20:22.7306 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LCSBYEldNr/fei+kf5gKvGhCIdVAhsSbmbMbcV3ucRHF/6fYrbElzUkbus9tDrz1Bhe/Sii4HmLQFL49WAFsRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6886
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

Thanks for review, please see my comments below.

Regards,
Zhanjun Dong


On 2024-10-16 10:12 a.m., Kamil Konieczny wrote:
> Hi Zhanjun,
> On 2024-10-15 at 08:31:01 -0700, Zhanjun Dong wrote:
>> Test with GuC reset, check if devcoredump register dump is within the
>> range.
>>
>> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
>> ---
>>   tests/intel/xe_exec_capture.c | 308 ++++++++++++++++++++++++++++++++++
>>   tests/meson.build             |   1 +
>>   2 files changed, 309 insertions(+)
>>   create mode 100644 tests/intel/xe_exec_capture.c
>>
>> diff --git a/tests/intel/xe_exec_capture.c b/tests/intel/xe_exec_capture.c
>> new file mode 100644
>> index 000000000..89b544c93
>> --- /dev/null
>> +++ b/tests/intel/xe_exec_capture.c
>> @@ -0,0 +1,308 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2024 Intel Corporation
>> + */
>> +
>> +/**
>> + * TEST: Basic tests for GuC based register capture
>> + * Category: Core
>> + * Mega feature: General Core features
>> + * Sub-category: CMD submission
>> + * Functionality: Debug
>> + * Test category: functionality test
>> + */
>> +
>> +#include <ctype.h>
>> +#include <fcntl.h>
>> +#include <stdio.h>
>> +#include <regex.h>
>> +
>> +#include "igt.h"
>> +#include "igt_device.h"
>> +#include "lib/igt_syncobj.h"
>> +#include "lib/intel_reg.h"
>> +#include "xe_drm.h"
>> +#include "xe/xe_ioctl.h"
>> +#include "xe/xe_query.h"
>> +#include "xe/xe_spin.h"
>> +
>> +#define MAX_N_EXECQUEUES		16
>> +#define MAX_INSTANCE			9
>> +#define GT_RESET			(0x1 << 0)
>> +#define CLOSE_FD			(0x1 << 1)
>> +#define CLOSE_EXEC_QUEUES		(0x1 << 2)
>> +#define VIRTUAL				(0x1 << 3)
>> +#define PARALLEL			(0x1 << 4)
>> +#define CAT_ERROR			(0x1 << 5)
>> +
>> +#define BASE_ADDRESS			0x1a0000
>> +/* Batch buffer element count, in number of dwords(uint32_t) */
>> +#define BATCH_DW_COUNT			16
>> +
>> +#define MAX_PATH_NAME_LEN		512
>> +#define MAX_LINES			512
>> +#define MAX_LINE_LEN			1024
>> +
>> +#define DUMP_PATH			"/sys/class/drm/card%d/device/devcoredump/data"
>> +#define START_TAG			"**** Job ****"
>> +#define REGEX_KEY_VALUE_PAIR		"^[ \t]*([^:]+):[ \t]*([^ \t]+)[ \t]*$"
>> +#define REGEX_KEY_INDEX			1
>> +#define REGEX_VALUE_INDEX		2
>> +#define REGEX_KEY_VALUE_MATCH_COUNT	3
>> +
>> +int card_id;
>> +regex_t regex;
>> +char lines[MAX_LINES][MAX_LINE_LEN];
> 
> Why only MAX_LINE here? Could you dynamically allocate mem (and eventually
> reallocate it) to fit all devcore?
The thought is only keep up to MAX_LINES here, focus on parts(after 
START_TAG) for this test only.

Might be better to load all content, in future if we want to parse more 
lines, there is no need to change the data loading part.
One more benefit I can think is for debugging purpose, if load all 
contents in buffer, the line index+1 is equal to the line number when we 
open the file in editor, make our life easier.

Will change it to load all in next rev.
> 
>> +
>> +static bool access_devcoredump(bool load_file)
>> +{
>> +	FILE *fd;
>> +	char path[MAX_PATH_NAME_LEN];
>> +
>> +	sprintf(path, DUMP_PATH, card_id);
>> +	fd = fopen(path, "r");
> 
> You have this pattern also below, please write a function and use it.
Will do, to support multiple cards, it would be a function like:

char *get_devcoredump_path

> 
>> +	if (!fd) {
>> +		igt_debug("Devcoredump not exist.\n");
> 
> Or there was some error, you could print errno here.
Sure, will add print errno
> Btw why FILE* ? Could you use just normal open()?
The devcoredump data is text content file, open with FILE* is more easy 
to deal with text lines.
> 
>> +		return false;
>> +	}
>> +	igt_debug("Devcoredump found: %s\n", path);
>> +
>> +	/* Clear memory before load file */
>> +	if (load_file) {
>> +		int i = 0;
>> +		bool found = false;
>> +
>> +		memset(lines, 0, sizeof(lines));
>> +		while (!feof(fd)) {
>> +			fgets(lines[i], MAX_LINE_LEN, fd);
>> +
>> +			/* Only save lines after start tag */
>> +			if (!found)
>> +				found = strstr(lines[0], START_TAG);
>> +			else
>> +				if (++i >= MAX_LINES)
>> +					break;
>> +		}
>> +	}
>> +
>> +	fclose(fd);
>> +	return true;
>> +}
>> +
>> +static void rm_devcoredump(void)
> 
> imho this could be bool
Sounds good. When caller try to remove not existing devcoredump, it 
could return false.
> 
>> +{
>> +	char path[MAX_PATH_NAME_LEN];
>> +	int fd;
>> +
>> +	igt_debug("Clearing devcoredump.\n");
>> +
>> +	sprintf(path, DUMP_PATH, card_id);
>> +	fd = open(path, O_WRONLY);
>> +	if (fd != -1) {
>> +		write(fd, "0", 1);
>> +		close(fd);
>> +	}
>> +}
>> +
>> +static char *get_coredump_item(const char *tag)
>> +{
>> +	int i;
>> +	regmatch_t match[REGEX_KEY_VALUE_MATCH_COUNT];
>> +
>> +	for (i = 0; i < MAX_LINES && lines[i][0]; i++) {
>> +		char *line = lines[i];
>> +
>> +		/* Skip lines without tag */
>> +		if (!strstr(line, tag))
>> +			continue;
>> +
>> +		if (regexec(&regex, line, REGEX_KEY_VALUE_MATCH_COUNT, match, 0) == 0) {
>> +			char *key, *value;
>> +
>> +			key = &line[match[REGEX_KEY_INDEX].rm_so];
>> +			line[match[REGEX_KEY_INDEX].rm_eo] = '\0';
>> +			value = &line[match[REGEX_VALUE_INDEX].rm_so];
>> +			line[match[REGEX_VALUE_INDEX].rm_eo] = '\0';
>> +
>> +			if (strcmp(tag, key) == 0)
>> +				return value;
>> +			/* if key != tag,  continue */
>> +		}
>> +	}
>> +
>> +	return NULL;
>> +}
>> +
>> +static void check_capture_output(const char *tag, uint64_t addr_lo, uint64_t addr_hi)
>> +{
>> +	uint64_t result;
>> +	char *output;
>> +
>> +	igt_assert(output = get_coredump_item(tag));
> 
> imho better igt_assert_f and print which tag is missing.
Good point, will do.
> 
>> +	result = strtol(output, NULL, 16);
>> +	igt_debug("Compare %s: %s vs [0x%lX-0x%lX]\n", tag, output, addr_lo, addr_hi);
>> +	igt_assert((addr_lo <= result) && (result <= addr_hi));
> 
> Same here, you could print actual values if assert failed.
Good point, will do.
> 
>> +}
>> +
>> +static void check_capture_output_str(const char *tag, const char *target)
>> +{
>> +	char *output;
>> +
>> +	igt_assert(output = get_coredump_item(tag));
> 
> Same here.
> 
>> +	igt_debug("Compare %s: '%s' vs '%s'\n", tag, output, target);
>> +	igt_assert(!strcmp(output, target));
> 
> Same here.
> 
>> +}
>> +
>> +static void check_capture_out(uint64_t base_addr, uint64_t length)
>> +{
>> +	/* assert devcoredump created */
>> +	assert(access_devcoredump(true));
> 
> Should be igt_assert_f
Thanks, that's my typo
> 
>> +
>> +	check_capture_output_str("Capture_source", "GuC");
>> +	check_capture_output("ACTHD", base_addr, base_addr +  length);
>> +	check_capture_output("RING_BBADDR", base_addr, base_addr + length);
>> +
>> +	/* clear devcoredump */
>> +	rm_devcoredump();
>> +	sleep(1);
>> +	/* Assert devcoredump removed */
>> +	assert(!access_devcoredump(false));
> 
> Should be igt_assert_f
same typo
> 
>> +}
>> +
>> +/**
>> + * SUBTEST: close-fd
>> + * Description: Test close fd, check if devcoredump register dump is within the
>> + */
>> +static void
>> +test_legacy_mode(int fd, struct drm_xe_engine_class_instance *eci,
>> +		 int n_exec_queues, int n_execs, unsigned int flags)
>> +{
>> +	uint32_t vm;
>> +	const uint64_t addr = BASE_ADDRESS;
>> +	struct drm_xe_sync sync[2] = {
>> +		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
>> +		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
>> +	};
>> +	struct drm_xe_exec exec = {
>> +		.num_batch_buffer = 1,
>> +		.num_syncs = 2,
>> +		.syncs = to_user_pointer(sync),
>> +	};
>> +	uint32_t exec_queues[MAX_N_EXECQUEUES];
>> +	uint32_t syncobjs[MAX_N_EXECQUEUES];
>> +	size_t bo_size;
>> +	uint32_t bo = 0;
>> +	struct {
>> +		struct xe_spin spin;
>> +		uint32_t batch[BATCH_DW_COUNT];
>> +		uint64_t pad;
>> +		uint32_t data;
>> +	} *data;
>> +	struct xe_spin_opts spin_opts = { .preempt = false };
>> +	int i, b;
>> +
>> +	igt_assert(n_exec_queues <= MAX_N_EXECQUEUES);
>> +
>> +	if (flags & CLOSE_FD)
>> +		fd = drm_open_driver(DRIVER_XE);
> 
> Better drm_reopen_driver()
Sounds good, while next rev will deal with multiple cards, this part 
might be changed.
> 
>> +
>> +	vm = xe_vm_create(fd, 0, 0);
>> +	bo_size = sizeof(*data) * n_execs;
>> +	bo_size = xe_bb_size(fd, bo_size);
>> +
>> +	bo = xe_bo_create(fd, vm, bo_size,
>> +			  vram_if_possible(fd, eci->gt_id),
>> +			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>> +	data = xe_bo_map(fd, bo, bo_size);
>> +
>> +	for (i = 0; i < n_exec_queues; i++) {
>> +		exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
>> +		syncobjs[i] = syncobj_create(fd, 0);
>> +	};
>> +
>> +	sync[0].handle = syncobj_create(fd, 0);
>> +	xe_vm_bind_async(fd, vm, 0, bo, 0, addr, bo_size, sync, 1);
>> +
>> +	for (i = 0; i < n_execs; i++) {
>> +		uint64_t base_addr = addr;
>> +		uint64_t batch_offset = (char *)&data[i].batch - (char *)data;
>> +		uint64_t batch_addr = base_addr + batch_offset;
>> +		uint64_t spin_offset = (char *)&data[i].spin - (char *)data;
>> +		uint64_t sdi_offset = (char *)&data[i].data - (char *)data;
>> +		uint64_t sdi_addr = base_addr + sdi_offset;
>> +		uint64_t exec_addr;
>> +		int e = i % n_exec_queues;
>> +
>> +		if (!i) {
>> +			spin_opts.addr = base_addr + spin_offset;
>> +			xe_spin_init(&data[i].spin, &spin_opts);
>> +			exec_addr = spin_opts.addr;
>> +		} else {
>> +			b = 0;
>> +			data[i].batch[b++] = MI_STORE_DWORD_IMM_GEN4;
>> +			data[i].batch[b++] = sdi_addr;
>> +			data[i].batch[b++] = sdi_addr >> 32;
>> +			data[i].batch[b++] = 0xc0ffee;
>> +			data[i].batch[b++] = MI_BATCH_BUFFER_END;
>> +			igt_assert(b <= ARRAY_SIZE(data[i].batch));
>> +
>> +			exec_addr = batch_addr;
>> +		}
>> +
>> +		sync[0].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
>> +		sync[1].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
>> +		sync[1].handle = syncobjs[e];
>> +
>> +		exec.exec_queue_id = exec_queues[e];
>> +		exec.address = exec_addr;
>> +		if (e != i)
>> +			syncobj_reset(fd, &syncobjs[e], 1);
>> +		xe_exec(fd, &exec);
>> +	}
>> +
>> +	for (i = 0; i < n_exec_queues && n_execs; i++)
>> +		igt_assert(syncobj_wait(fd, &syncobjs[i], 1, INT64_MAX, 0,
>> +					NULL));
>> +	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
>> +
>> +	sync[0].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
>> +	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
>> +	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
>> +
>> +	syncobj_destroy(fd, sync[0].handle);
>> +	for (i = 0; i < n_exec_queues; i++) {
>> +		syncobj_destroy(fd, syncobjs[i]);
>> +		xe_exec_queue_destroy(fd, exec_queues[i]);
>> +	}
>> +
>> +	munmap(data, bo_size);
>> +	gem_close(fd, bo);
>> +	xe_vm_destroy(fd, vm);
>> +}
>> +
>> +igt_main
>> +{
>> +	struct drm_xe_engine_class_instance *hwe;
>> +	int fd;
>> +
>> +	igt_fixture {
>> +		fd = drm_open_driver(DRIVER_XE);
>> +		card_id = igt_device_get_card_index(fd);
>> +
> 
> imho here clear old devcoredump
Yes, should clear old one if exist.
> 
> Regards,
> Kamil
> 
>> +		regcomp(&regex, REGEX_KEY_VALUE_PAIR, REG_EXTENDED | REG_NEWLINE);
>> +	}
>> +
>> +	igt_subtest("close-fd")
>> +		xe_for_each_engine(fd, hwe) {
>> +			igt_debug("Running on engine class: %x instance: %x\n", hwe->engine_class,
>> +				  hwe->engine_instance);
>> +
>> +			test_legacy_mode(fd, hwe, 1, 1, 0);
>> +			check_capture_out(BASE_ADDRESS, sizeof(uint32_t) * BATCH_DW_COUNT);
>> +		}
>> +
>> +	igt_fixture {
>> +		drm_close_driver(fd);
>> +		regfree(&regex);
>> +	}
>> +}
>> diff --git a/tests/meson.build b/tests/meson.build
>> index 2d8cb87d5..b724a7c6d 100644
>> --- a/tests/meson.build
>> +++ b/tests/meson.build
>> @@ -284,6 +284,7 @@ intel_xe_progs = [
>>   	'xe_exec_atomic',
>>   	'xe_exec_balancer',
>>   	'xe_exec_basic',
>> +	'xe_exec_capture',
>>   	'xe_exec_compute_mode',
>>   	'xe_exec_fault_mode',
>>   	'xe_exec_mix_modes',
>> -- 
>> 2.34.1
>>
