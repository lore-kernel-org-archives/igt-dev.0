Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BB40D116EE
	for <igt-dev@archiver.kernel.org>; Fri, 25 Oct 2024 05:20:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A07610E02E;
	Fri, 25 Oct 2024 05:20:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="inkwIDyT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B70BE10E02E
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Oct 2024 05:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729833648; x=1761369648;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=9Cp9L2+cr+rKLX6ncOYBh47A2nLn3301CcdJoG76Gm8=;
 b=inkwIDyTEPeBcph09pEV9aLY/YOFjH3Q62aniJeCX2yRA7NBt8gp5KOe
 oV6BpsDe2EER3BvuSTdLVcBMZBE9I6k/DwF1MZJ3lm8dwl9bnKYrzWbxX
 hBfySYccuJSvZnMvF1upQQzWwWT6ty+JLscTnmS1fl36angcDVQRxhCty
 uwO0MesXDQgCDD2ozaE+fd2Phi0Tk5EyORcA6x6rNc3vdGqQdHFsMI/iJ
 vhNrITDN2kHsLvLWgFBr9qIKYiwh9rFbx9kPvHRQYQxrA2YRFtTJm9m7i
 ngyjczIHE8tR8GXIoiCk7+fu/DiwQjnA46DWGHa2w/DQNM7pqdisw0cJs Q==;
X-CSE-ConnectionGUID: 46/fKGR+SimqdzLrTuqQxA==
X-CSE-MsgGUID: 0P86QrKzQliu3lwxYFoATw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="40037643"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="40037643"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2024 22:20:48 -0700
X-CSE-ConnectionGUID: 8s2LJd7/TamzJXgZvRnc/g==
X-CSE-MsgGUID: BoqoUfffQiGpp2zkmKD7NQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; d="scan'208";a="111628511"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Oct 2024 22:20:47 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 24 Oct 2024 22:20:46 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 24 Oct 2024 22:20:46 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.171)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 24 Oct 2024 22:20:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pSQBAmsXrP6zUydf0eiT3HC7rjeQTjp3mNGYOuBp3ot8pzQ7+LUxnJH8u9UfuqfyvcxbicbBscyJ2UkT87u9lWR1fVVo2KJ/FjWb4aI/lpQpFiqk/E0YTsrnNcTC0VDmpvkKxb1pf2CoBS3cBdvwDusnKkYqxDS9sXs1KttytZez0Kz+uVURpZnuX2fB/+ExY6sDCciBaKVRkIyxqdFTa9a/gW5f26lFzyTtjX3iNDhBs/mYTcrW9affSTleFMHp0iHpEE8zasNSB6IacfgcZgWFwjUB2tsCwR+d5OwDbB5+XO3ZhavL1HdJAcTLFOVW9Re/IAKDV2/T4/XmJ04sWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Cp9L2+cr+rKLX6ncOYBh47A2nLn3301CcdJoG76Gm8=;
 b=HYaWYEE/8VR9e9xOZHFkDndn7aOj2/KY4fbEoDKy2qg42JGufuR0ytd9KqdsoymZgQG8GsIAGHHu9OVgpivjPSeqKgg32du5KaeHWwiRHCw7OyLPIzW+Egm5orhCcn/GITSA5VOTn40lm7Cwy07LTh4JIBRstXdOm9sJOVFSAukfZFNsFL8ZKcVYcB6yEkw7VEnGAXXUbw8/vkWziS3VQYE3UPD7OsGyXIlnG9UJtg+omvv2g3pYyLwuKlilceqRvz2veGPcYXmgQWsLwJ0gLsTFPZlawoGrMOsBQNQy6PkEQmTg0+e/VieMJHBpXPm9yGW2fvjlR9LtPX9CQTy5zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6360.namprd11.prod.outlook.com (2603:10b6:8:bd::12) by
 CY5PR11MB6163.namprd11.prod.outlook.com (2603:10b6:930:28::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8093.19; Fri, 25 Oct 2024 05:20:44 +0000
Received: from DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::8648:3a6b:af5c:b6e6]) by DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::8648:3a6b:af5c:b6e6%6]) with mapi id 15.20.8093.018; Fri, 25 Oct 2024
 05:20:44 +0000
From: "Shankar, Uma" <uma.shankar@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t] tests/kms_color: Move dynamic subtests even further
 out
Thread-Topic: [PATCH i-g-t] tests/kms_color: Move dynamic subtests even
 further out
Thread-Index: AQHbH8j54rJ2E8bP9UmRGlITqjMXYLKW+0+A
Date: Fri, 25 Oct 2024 05:20:44 +0000
Message-ID: <DM4PR11MB6360E7845A1C6A064AF366FDF44F2@DM4PR11MB6360.namprd11.prod.outlook.com>
References: <20241016124301.25968-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20241016124301.25968-1-ville.syrjala@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6360:EE_|CY5PR11MB6163:EE_
x-ms-office365-filtering-correlation-id: 1b502c9c-7a33-4d89-1f8a-08dcf4b4c674
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?ZHY4Z3BmaGw0M2Y3WmJnLzR5cTRkYXprVlRjN2FZNkpNSXViY1c1KzlOTTlT?=
 =?utf-8?B?enV3ZDhpcytZZDZEMTlnUFZqaExacHBYZUhFMkJoeThLOVBCTnZSZ1kzQ0lF?=
 =?utf-8?B?VjdXUkVIMU0zTDg1VURSaFQ0M05mOTIwaW5zamV6cW85TnNtR2pVOFkwc3JW?=
 =?utf-8?B?cFFGRXFmNFVmSzRNeEpUeGdjSFkrK3NuenpudUJRK2Z1Z1IySVIxM2Z5OVdq?=
 =?utf-8?B?VzVCUFNYaWF1ZlF6c1kzVXpaZWdXUzBJQitRQndQSlh6L1Y3WWNzazFaZm00?=
 =?utf-8?B?c1Ryd01vL3grU2hwVkN2WjVtNFhIMGRiL0VHbFlGU1ZUR1hHQjBYYjJhN3Jx?=
 =?utf-8?B?ZHlWSTU0VExQOWk2WThpWHRCL3ZGZjVXcm95SDJLN1FoWENSaUM0RlBLNzhq?=
 =?utf-8?B?QTNkbGFZaUdNcmQ1eXlMU1oxclRSZCszUWd0QjlZdWV4NDdBSmlTYUJmaGI5?=
 =?utf-8?B?cTg1Nm5RY2pQSEJOc1VXRzhRRFpEZ0RKak5WZU1ieVp4Q1pRaENpUnFnRnds?=
 =?utf-8?B?WDE4SmQ0UmVGRlBiNUZXY0dLSW1yMTlJSnNtdXZyekd3bWoramgrVXVzWWlu?=
 =?utf-8?B?cm5Hdis2bk44OW5PY1VVelpXakVYTzVnbkoxbElCSVZuangzWkpsMTN1Q1pm?=
 =?utf-8?B?K0xWV2pOWlJCT2Y5aVZERithNG9zcnp5aGFNRWFtNkJDTzQ4d1ZYbU9wWEpu?=
 =?utf-8?B?ZExSWWVsS3p0TllnVzMzRzhOZFlhOEYxWUMrQjE0cFZKQ29BZ0RYM2dwOGow?=
 =?utf-8?B?TTVRQjBDUis3Q2dPekZUY1dxU0llMjlZaVk2YnBFeXlOazl3Z1lCd28wNVpM?=
 =?utf-8?B?UW1WdjdBTkUvTi9XTEFNZGxnQUtkR21IejhHRTByMEVKSjQ1SGsrd3BwVFNF?=
 =?utf-8?B?OVhmR1BXKzJyYkhZOUk0RDJ3R1RETDdlam56UEJ1bDBOQmt5eHhOOHkwMDhB?=
 =?utf-8?B?MnpqSHlDMXgzRzhSbk5qZkhJZEl3TUtlYm5EdjFyUkpQWWF4ZkVITms3WmlZ?=
 =?utf-8?B?TC84WDBHSUg1b3FKeGVsQ2I1MUEreDZwaTNGdlhGajkxRkkxeEZsUjJLN1Fj?=
 =?utf-8?B?aWRvUmJ4bnBJU01BOERrMkRETmUzZ2FlaUVJVE9YNkRCTjUrbTFtajdDWlRi?=
 =?utf-8?B?S0VrVHp1UWlsTUw5VWdaMkNRdmR3aG5keTFRbUw4RDUxU21rT29DSzBXemVH?=
 =?utf-8?B?ZjByYXoxNlgwMVlVOWhidnBHbmp4QkdwTlZhMTU0R29CUEdtMUdOckNGbnRE?=
 =?utf-8?B?dVZlcXFBTXFWZ0FCakhTYVhEYmNtTW9hNC9CVEc1WGthcm9PcmxwS2xJcFQ3?=
 =?utf-8?B?bjJ2SUVpRmtoQUViQ1ZhQklEcFlqU2dhSGxESU4vWjBhQ1U5bTVLQ0pXSXRH?=
 =?utf-8?B?ai95OE9JdzVCd2pNOGcxTXFOT2FoR0t6bC9TQXNOTHdFZ1ovbjhKRWRVdGly?=
 =?utf-8?B?Rnc5QUtvSWxEdmtsUFhOY0hlVk42MGZCTEFuaVlsdnVrS213cEZFNGFVVlR2?=
 =?utf-8?B?TUFsN09waXA0SHErajJpekZzSzV0d3YyODlONmZUTEFnUWhSN0hwMUk3cVFi?=
 =?utf-8?B?MGRBeGJ0MDIxd3I4R0N3dU9RMFZYKzlWTWwrQSt2VnNwUTBKdjlpd3QvTW9p?=
 =?utf-8?B?bSt0YzlGNEhrTmVPaGZ3S3d6OEFIcGR5dHpVakd4VGh4RUxRUGF2eVpWL1Ft?=
 =?utf-8?B?R1gzMlc5ZGdkaDdyQ1pIRXozTC9DNXhVQysreGJsMU5oVEFpaDl2aXlGd0lm?=
 =?utf-8?B?K3NpZUV0YllaQVlYR0taMkJNS2ZjUGRCZ3M4V09HdXFKbkVhVE1RQWQ2U244?=
 =?utf-8?Q?w5uky1sSAaZYWIQDr/DFdGIIK/+VM2zAf3bLU=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6360.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U1BOQjRFUEM5OEVvM3dxOWwxOWdNdXFEUG85WkNpdkltbWx2bCtBL0UzMDZr?=
 =?utf-8?B?UnQ3N2VLMktRa1B5RmtIejZXdzMzQ0FmMzI4Z3g3VXVZVUpneVhCbUF4Vlll?=
 =?utf-8?B?RGN5M3N0MU5oRXNtaDM2Y2J0MVM4Q3YxamtRaENFVWtXV2Q1cXMyTjVPczVl?=
 =?utf-8?B?aVczTThZcmZSZUF2QnllYjVOOXZqUXZzMkMyWHpEZDlYcURuZHAwZDdaWi82?=
 =?utf-8?B?NWRzQXRKTWYvc0M4aStrdEJQUWxyZlY3RTJUeTE2dWpvcjliTVY5OHNMbm5S?=
 =?utf-8?B?RjE2MlloVkxzdmVoRTY4R25NMG5YQXk3bWo2UVZQdUpHalFDODl2cUxYb2c1?=
 =?utf-8?B?Y0puZ3h3cGlNeDdyN1J6KzFJMnllMU1aQ3lubjRYV1lFbGprMStnWHRIT2pi?=
 =?utf-8?B?Kzh5MTc4ZHozRlJtVXJydmJHQmJtdlA0NVJTYjVMTDNSbS8wY3c3b2Y5bjVv?=
 =?utf-8?B?YXU0a3JVN0JpR2QzZ0dCR3NJaUlndlVQNS8vb0NvUnI0RVcwSTV0Z1piWFpV?=
 =?utf-8?B?MGRLZjJUbDY4ZVk4a3ExNm4vY2lSNVFtRWRJVzJSbW1SeFFYbnR4TjZ3anIw?=
 =?utf-8?B?Y1ZNdFVUVXg0LzdOQ29TL0RnaTdoTnNjRE1WQ3RFY2J0b1NRNWhiR1RJWG1w?=
 =?utf-8?B?V1d0amxnRWhVK0dQOWJzVWpudUtCcER5dEtldnRObmpnU1llVFlCdldsVElI?=
 =?utf-8?B?L2gra0IyczAyNDR5eVpyTnkzVVo4M0Y1VW1iSytkQkVpWE04cWZWRDFrUmhY?=
 =?utf-8?B?VkJKSDZWZFV4azlFZldZVkVsMG1ZNmdMYTZwYnhjcXdNNDJzYTAweWs1NnZC?=
 =?utf-8?B?aHE4MmRmcE5MMUhoS1hJZEJGWmVlaDNvNEdUQzVYWnExZ3FxUWpFSDdtTFgy?=
 =?utf-8?B?bVM5NVNJNGFVUFdpL3dVUUkxWnhTZ2RuaHZFaVd1Q3NDKzIyVSttblA0T1Ay?=
 =?utf-8?B?NGxWOEw1enZidUpjaTU1ZHh5dTJlUDVHWis2SjA2T1lub2RaQzZwU0JOM2NM?=
 =?utf-8?B?T1YyWTNwQ0pJQTNIQ25XWlNFdVJRNGswQnE3UmZkQkpTZzB5Y05sWmV5VE5i?=
 =?utf-8?B?a1dLeWNYY0VnMmNMRzhRb3djWHdidUd6a04zQ0JSZDRaVzFLekVXaFRlV1FT?=
 =?utf-8?B?bVp2bHFmSFNwd3RKNS9HRURxYUwyVGo0RFE1Q3pXQ0ROZ25kTXY4TURJNFFQ?=
 =?utf-8?B?bXZ3THRKem9DUWpTZWlvcjNQaDV2NkRhZU8yaWpPOFAyeTRsMUtac2N3RTlw?=
 =?utf-8?B?RnNvMXZvdDRYSDFybmduaVNTUE9vZ1VsVGQ0dGFRWXowMTc4anE4VFVYdXJv?=
 =?utf-8?B?YnBJQ3NMQjhleXBHb0ZPNThCOHJGVE5LYnJiSDkxSE92Z0FhTWNvbUtxeWtn?=
 =?utf-8?B?dWJlV2RBajByZWhCM0MrbWV2MkVlWEFucG4vMXlvVHRqRkY4MTYzOERENGMy?=
 =?utf-8?B?Zmg3akwxaDE4eGZKSzU2RExMaVBBRUdQLzZRaC9zQy8xaUJWTXFpYVhXWVd5?=
 =?utf-8?B?bU9YRzNPNFUrOXdBWm9WV3hGRDZqOE9scks1U3hVWTExRG1qc2FrSW5GOWVp?=
 =?utf-8?B?TXVleW9FaXo3ejJMU0ZUWFk1NUJXclpJOHV0TTVqZ3lISzJ6aityZnRpd3pC?=
 =?utf-8?B?NTFXaWpRUkRVRHgwVTRYSER3c2M5VGJ3cWtWcWlxKzVaK3VKUUZwR0FTanBz?=
 =?utf-8?B?QXR0ejNjYzk2YnVzSHV2N1NvOEVha0x4d29EMVdmOXEwYm5RZzYwZGlOeVZZ?=
 =?utf-8?B?VDljc1ExMXVYYkhEYmZBcmhhMEYwVVZCR2NEcWJ2bXZhMnZGS09YdkhZRWlI?=
 =?utf-8?B?dUN0TnVTYU5BU28xMWxLYjNxQjBoeWZXRjJCV2NzaXY5U3ZoVVVRVjh6V3pB?=
 =?utf-8?B?ZnVYUmlkQkcwT3E0aUFrYUxSUUZWazg1U1piTzRPdVJhSWYrODhiNDVtazRP?=
 =?utf-8?B?S2JuSkN5MmhSK1ozRklIRERKOEJ1dm8wV2E5R2cvSnFubzliME9XWXZwZktW?=
 =?utf-8?B?UmR1MVdBSitHZTNWREh3L3labnhzTmpaY0wxQmNXNGh4Tkc2TGNXUERvZFVI?=
 =?utf-8?B?Z3I2NXZlNXk2U1cwNjdXczBkVnRrNC9kdzFUbUtxZEREOUpsZjlQVmZaRmtF?=
 =?utf-8?Q?UNq5MCuHxYQ07q49NPZz2OKbr?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6360.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b502c9c-7a33-4d89-1f8a-08dcf4b4c674
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2024 05:20:44.0354 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HFPw13UpHhIKMxcXtTGuEvOuczgRQy1y8D56J2km9g6X6QWHJS19k4m5w7oHfnqwZlSUvEW0PjQExfANzQTJpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6163
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogaWd0LWRldiA8aWd0LWRl
di1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mIFZpbGxlIFN5cmph
bGENCj4gU2VudDogV2VkbmVzZGF5LCBPY3RvYmVyIDE2LCAyMDI0IDY6MTMgUE0NCj4gVG86IGln
dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IFN1YmplY3Q6IFtQQVRDSCBpLWctdF0gdGVz
dHMva21zX2NvbG9yOiBNb3ZlIGR5bmFtaWMgc3VidGVzdHMgZXZlbiBmdXJ0aGVyIG91dA0KPiAN
Cj4gRnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4N
Cj4gDQo+IEluIG9yZGVyIHRvIHJ1biB0aGlzIG9uIG9sZGVyIEludGVsIGJhc2VkIGxhcHRvcHMg
d2UgaGF2ZSB0byBtYWtlIGl0IHdvcmsgZm9yIGNhc2VzDQo+IHdoZXJlIHdlIGhhdmUganVzdCBw
aXBlIEIgZHJpdmluZyB0aGUgc2luZ2xlIExWRFMgb3V0cHV0LiBDdXJyZW50bHkgdGhlIHRlc3Qg
anVzdA0KPiBza2lwcyBiZWNhdXNlIGl0IHRyaWVzIHBpcGUgQSBmaXJzdCB3aGljaCB3b24ndCBo
YXZlIGEgY29ubmVjdGVkIG91dHB1dC4gTW92ZSB0aGUNCj4gb3V0cHV0IHNlbGVjdGlvbiBmdXJ0
aGVyIG91dCB0byByZW1lZHkgdGhpcy4NCj4gDQo+IEkgdGhvdWdodCBJIGFscmVhZHkgZml4ZWQg
dGhpcyBvbmNlIHdpdGggY29tbWl0IDc2NmVkZjk2OTc5Yg0KPiAoInRlc3RzL2ttc19jb2xvcjog
TW92ZSBkeW5hbWljIHN1YnRlc3RzIHVwIG9uZSBsZXZlbCIpIGJ1dCBpdCBjbGVhcmx5IGlzbid0
DQo+IHdvcmtpbmcgbm93LiBFaXRoZXIgSSBmYWlsZWQgdGhlcmUgb3IgdGhpcyBoYXMgcmVncmVy
ZXNzZWQgYWdhaW4gZHVlIHRvIHNvbWUgb3RoZXINCj4gY2hhbmdlcy4NCg0KTG9va3MgR29vZCB0
byBtZS4NClJldmlld2VkLWJ5OiBVbWEgU2hhbmthciA8dW1hLnNoYW5rYXJAaW50ZWwuY29tPg0K
DQo+IFNpZ25lZC1vZmYtYnk6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5p
bnRlbC5jb20+DQo+IC0tLQ0KPiAgdGVzdHMva21zX2NvbG9yLmMgfCA3OCArKysrKysrKysrKysr
KysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDM4
IGluc2VydGlvbnMoKyksIDQwIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL3Rlc3Rz
L2ttc19jb2xvci5jIGIvdGVzdHMva21zX2NvbG9yLmMgaW5kZXgNCj4gNWYwMTI4YmNhZDllLi5k
NjQyZjU2MWRmNzYgMTAwNjQ0DQo+IC0tLSBhL3Rlc3RzL2ttc19jb2xvci5jDQo+ICsrKyBiL3Rl
c3RzL2ttc19jb2xvci5jDQo+IEBAIC03ODcsMTIgKzc4NywxMCBAQCBydW5fZ2FtbWFfZGVnYW1t
YV90ZXN0c19mb3JfcGlwZShkYXRhX3QgKmRhdGEsDQo+IGVudW0gcGlwZSBwLA0KPiAgCWRhdGEt
PmRybV9mb3JtYXQgPSBEUk1fRk9STUFUX1hSR0I4ODg4Ow0KPiAgCWRhdGEtPm1vZGUgPSBpZ3Rf
b3V0cHV0X2dldF9tb2RlKGRhdGEtPm91dHB1dCk7DQo+IA0KPiAtCWlmICghcGlwZV9vdXRwdXRf
Y29tYm9fdmFsaWQoZGF0YSwgcCkpDQo+IC0JCWdvdG8gb3V0Ow0KPiArCWlndF9yZXF1aXJlKHBp
cGVfb3V0cHV0X2NvbWJvX3ZhbGlkKGRhdGEsIHApKTsNCj4gKw0KPiArCWlndF9hc3NlcnQodGVz
dF90KGRhdGEsIGRhdGEtPnByaW1hcnkpKTsNCj4gDQo+IC0JaWd0X2R5bmFtaWNfZigicGlwZS0l
cy0lcyIsIGttc3Rlc3RfcGlwZV9uYW1lKHApLA0KPiBpZ3Rfb3V0cHV0X25hbWUoZGF0YS0+b3V0
cHV0KSkNCj4gLQkJaWd0X2Fzc2VydCh0ZXN0X3QoZGF0YSwgZGF0YS0+cHJpbWFyeSkpOw0KPiAt
b3V0Og0KPiAgCXRlc3RfY2xlYW51cChkYXRhKTsNCj4gIH0NCj4gDQo+IEBAIC04MjYsNDAgKzgy
NCwzNiBAQCBydW5fY3RtX3Rlc3RzX2Zvcl9waXBlKGRhdGFfdCAqZGF0YSwgZW51bSBwaXBlIHAs
DQo+ICAJZGF0YS0+ZHJtX2Zvcm1hdCA9IERSTV9GT1JNQVRfWFJHQjg4ODg7DQo+ICAJZGF0YS0+
bW9kZSA9IGlndF9vdXRwdXRfZ2V0X21vZGUoZGF0YS0+b3V0cHV0KTsNCj4gDQo+IC0JaWYgKCFw
aXBlX291dHB1dF9jb21ib192YWxpZChkYXRhLCBwKSkNCj4gLQkJZ290byBvdXQ7DQo+ICsJaWd0
X3JlcXVpcmUocGlwZV9vdXRwdXRfY29tYm9fdmFsaWQoZGF0YSwgcCkpOw0KPiANCj4gIAlpZiAo
IWl0ZXIpDQo+ICAJCWl0ZXIgPSAxOw0KPiANCj4gLQlpZ3RfZHluYW1pY19mKCJwaXBlLSVzLSVz
Iiwga21zdGVzdF9waXBlX25hbWUocCksDQo+IGlndF9vdXRwdXRfbmFtZShkYXRhLT5vdXRwdXQp
KSB7DQo+IC0JCS8qDQo+IC0JCSAqIFdlIHRlc3RzIGEgZmV3IHZhbHVlcyBhcm91bmQgdGhlIGV4
cGVjdGVkIHJlc3VsdCBiZWNhdXNlDQo+IC0JCSAqIGl0IGRlcGVuZHMgb24gdGhlIGhhcmR3YXJl
IHdlJ3JlIGRlYWxpbmcgd2l0aCwgd2UgY2FuIGVpdGhlcg0KPiAtCQkgKiBnZXQgY2xhbXBlZCBv
ciByb3VuZGVkIHZhbHVlcyBhbmQgd2UgYWxzbyBuZWVkIHRvIGFjY291bnQNCj4gLQkJICogZm9y
IG9kZCBudW1iZXIgb2YgaXRlbXMgaW4gdGhlIExVVHMuDQo+IC0JCSAqLw0KPiAtCQlmb3IgKGkg
PSAwOyBpIDwgaXRlcjsgaSsrKSB7DQo+IC0JCQljb2xvcl90IGV4cGVjdGVkX2NvbG9yc1szXSA9
IHsNCj4gLQkJCQlmYl9jb2xvcnNbMF0sDQo+IC0JCQkJZmJfY29sb3JzWzFdLA0KPiAtCQkJCWZi
X2NvbG9yc1syXSwNCj4gLQkJCX07DQo+IC0NCj4gLQkJCXRyYW5zZm9ybV9jb2xvcigmZXhwZWN0
ZWRfY29sb3JzWzBdLCBjdG0sIGRlbHRhICogKGkgLQ0KPiAoaXRlciAvIDIpKSk7DQo+IC0JCQl0
cmFuc2Zvcm1fY29sb3IoJmV4cGVjdGVkX2NvbG9yc1sxXSwgY3RtLCBkZWx0YSAqIChpIC0NCj4g
KGl0ZXIgLyAyKSkpOw0KPiAtCQkJdHJhbnNmb3JtX2NvbG9yKCZleHBlY3RlZF9jb2xvcnNbMl0s
IGN0bSwgZGVsdGEgKiAoaSAtDQo+IChpdGVyIC8gMikpKTsNCj4gLQ0KPiAtCQkJaWYgKHRlc3Rf
cGlwZV9jdG0oZGF0YSwgZGF0YS0+cHJpbWFyeSwgZmJfY29sb3JzLA0KPiAtCQkJCQkgIGV4cGVj
dGVkX2NvbG9ycywgY3RtKSkgew0KPiAtCQkJCXN1Y2Nlc3MgPSB0cnVlOw0KPiAtCQkJCWJyZWFr
Ow0KPiAtCQkJfQ0KPiArCS8qDQo+ICsJICogV2UgdGVzdHMgYSBmZXcgdmFsdWVzIGFyb3VuZCB0
aGUgZXhwZWN0ZWQgcmVzdWx0IGJlY2F1c2UNCj4gKwkgKiBpdCBkZXBlbmRzIG9uIHRoZSBoYXJk
d2FyZSB3ZSdyZSBkZWFsaW5nIHdpdGgsIHdlIGNhbiBlaXRoZXINCj4gKwkgKiBnZXQgY2xhbXBl
ZCBvciByb3VuZGVkIHZhbHVlcyBhbmQgd2UgYWxzbyBuZWVkIHRvIGFjY291bnQNCj4gKwkgKiBm
b3Igb2RkIG51bWJlciBvZiBpdGVtcyBpbiB0aGUgTFVUcy4NCj4gKwkgKi8NCj4gKwlmb3IgKGkg
PSAwOyBpIDwgaXRlcjsgaSsrKSB7DQo+ICsJCWNvbG9yX3QgZXhwZWN0ZWRfY29sb3JzWzNdID0g
ew0KPiArCQkJZmJfY29sb3JzWzBdLA0KPiArCQkJZmJfY29sb3JzWzFdLA0KPiArCQkJZmJfY29s
b3JzWzJdLA0KPiArCQl9Ow0KPiArDQo+ICsJCXRyYW5zZm9ybV9jb2xvcigmZXhwZWN0ZWRfY29s
b3JzWzBdLCBjdG0sIGRlbHRhICogKGkgLSAoaXRlciAvIDIpKSk7DQo+ICsJCXRyYW5zZm9ybV9j
b2xvcigmZXhwZWN0ZWRfY29sb3JzWzFdLCBjdG0sIGRlbHRhICogKGkgLSAoaXRlciAvIDIpKSk7
DQo+ICsJCXRyYW5zZm9ybV9jb2xvcigmZXhwZWN0ZWRfY29sb3JzWzJdLCBjdG0sIGRlbHRhICog
KGkgLSAoaXRlciAvIDIpKSk7DQo+ICsNCj4gKwkJaWYgKHRlc3RfcGlwZV9jdG0oZGF0YSwgZGF0
YS0+cHJpbWFyeSwgZmJfY29sb3JzLA0KPiArCQkJCSAgZXhwZWN0ZWRfY29sb3JzLCBjdG0pKSB7
DQo+ICsJCQlzdWNjZXNzID0gdHJ1ZTsNCj4gKwkJCWJyZWFrOw0KPiAgCQl9DQo+IC0JCWlndF9h
c3NlcnQoc3VjY2Vzcyk7DQo+ICAJfQ0KPiArCWlndF9hc3NlcnQoc3VjY2Vzcyk7DQo+IA0KPiAt
b3V0Og0KPiAgCXRlc3RfY2xlYW51cChkYXRhKTsNCj4gIH0NCj4gDQo+IEBAIC0xMTQzLDkgKzEx
MzcsMTEgQEAgcnVuX3Rlc3RzX2Zvcl9waXBlKGRhdGFfdCAqZGF0YSkNCj4gIAlmb3IgKGkgPSAw
OyBpIDwgQVJSQVlfU0laRShnYW1tYV9kZWdhbW1hX3Rlc3RzKTsgaSsrKSB7DQo+ICAJCWlndF9k
ZXNjcmliZV9mKCIlcyIsIGdhbW1hX2RlZ2FtbWFfdGVzdHNbaV0uZGVzYyk7DQo+ICAJCWlndF9z
dWJ0ZXN0X3dpdGhfZHluYW1pY19mKCIlcyIsDQo+IGdhbW1hX2RlZ2FtbWFfdGVzdHNbaV0ubmFt
ZSkgew0KPiAtCQkJZm9yX2VhY2hfcGlwZSgmZGF0YS0+ZGlzcGxheSwgcGlwZSkgew0KPiAtCQkJ
CXJ1bl9nYW1tYV9kZWdhbW1hX3Rlc3RzX2Zvcl9waXBlKGRhdGEsDQo+IHBpcGUsDQo+IC0NCj4g
Z2FtbWFfZGVnYW1tYV90ZXN0c1tpXS50ZXN0X3QpOw0KPiArCQkJZm9yX2VhY2hfcGlwZV93aXRo
X3ZhbGlkX291dHB1dCgmZGF0YS0+ZGlzcGxheSwgcGlwZSwNCj4gZGF0YS0+b3V0cHV0KSB7DQo+
ICsJCQkJaWd0X2R5bmFtaWNfZigicGlwZS0lcy0lcyIsDQo+IGttc3Rlc3RfcGlwZV9uYW1lKHBp
cGUpLA0KPiArCQkJCQkgICAgICBpZ3Rfb3V0cHV0X25hbWUoZGF0YS0+b3V0cHV0KSkNCj4gKw0K
PiAJcnVuX2dhbW1hX2RlZ2FtbWFfdGVzdHNfZm9yX3BpcGUoZGF0YSwgcGlwZSwNCj4gKw0KPiBn
YW1tYV9kZWdhbW1hX3Rlc3RzW2ldLnRlc3RfdCk7DQo+ICAJCQl9DQo+ICAJCX0NCj4gIAl9DQo+
IEBAIC0xMTUzLDExICsxMTQ5LDEzIEBAIHJ1bl90ZXN0c19mb3JfcGlwZShkYXRhX3QgKmRhdGEp
DQo+ICAJZm9yIChpID0gMDsgaSA8IEFSUkFZX1NJWkUoY3RtX3Rlc3RzKTsgaSsrKSB7DQo+ICAJ
CWlndF9kZXNjcmliZV9mKCIlcyIsIGN0bV90ZXN0c1tpXS5kZXNjKTsNCj4gIAkJaWd0X3N1YnRl
c3Rfd2l0aF9keW5hbWljX2YoIiVzIiwgY3RtX3Rlc3RzW2ldLm5hbWUpIHsNCj4gLQkJCWZvcl9l
YWNoX3BpcGUoJmRhdGEtPmRpc3BsYXksIHBpcGUpIHsNCj4gLQkJCQlydW5fY3RtX3Rlc3RzX2Zv
cl9waXBlKGRhdGEsIHBpcGUsDQo+IC0JCQkJCQkgICAgICAgY3RtX3Rlc3RzW2ldLmZiX2NvbG9y
cywNCj4gLQkJCQkJCSAgICAgICBjdG1fdGVzdHNbaV0uY3RtLA0KPiAtCQkJCQkJICAgICAgIGN0
bV90ZXN0c1tpXS5pdGVyKTsNCj4gKwkJCWZvcl9lYWNoX3BpcGVfd2l0aF92YWxpZF9vdXRwdXQo
JmRhdGEtPmRpc3BsYXksIHBpcGUsDQo+IGRhdGEtPm91dHB1dCkgew0KPiArCQkJCWlndF9keW5h
bWljX2YoInBpcGUtJXMtJXMiLA0KPiBrbXN0ZXN0X3BpcGVfbmFtZShwaXBlKSwNCj4gKwkJCQkJ
ICAgICAgaWd0X291dHB1dF9uYW1lKGRhdGEtPm91dHB1dCkpDQo+ICsJCQkJCXJ1bl9jdG1fdGVz
dHNfZm9yX3BpcGUoZGF0YSwgcGlwZSwNCj4gKw0KPiBjdG1fdGVzdHNbaV0uZmJfY29sb3JzLA0K
PiArCQkJCQkJCSAgICAgICBjdG1fdGVzdHNbaV0uY3RtLA0KPiArCQkJCQkJCSAgICAgICBjdG1f
dGVzdHNbaV0uaXRlcik7DQo+ICAJCQl9DQo+ICAJCX0NCj4gIAl9DQo+IC0tDQo+IDIuNDUuMg0K
DQo=
