Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2D03C30653
	for <igt-dev@archiver.kernel.org>; Wed, 26 Jun 2024 11:34:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7630210E841;
	Wed, 26 Jun 2024 11:34:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FBQ3kJ+N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C974D10E85B
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Jun 2024 11:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719401640; x=1750937640;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=kIBGswXsY4o23T04mqn5+ptx4FgyC+n/mw9gQzDGOes=;
 b=FBQ3kJ+NIaF0mvvt+DZYmsJJJY/3wEJyznsbY5+MXTd/8UF5kYOBi+dv
 8rgerxLANTylniAqo3b1wMhyaFdFVmiRZcnH8cix00aacFNYZuBRv4dX3
 Kt4+AK7EuyNfQY5/pW5cGbgedI0OnQS2TCOZKY6Cts9KuRj7fzNADeIKe
 5A5CFez+JEc14wBGGfHJcAR83l1pUb8YPMshyjutcEIYrZlgoH5lWlFrx
 mNIPQpkpSi1hloh353QOSSrkfS011dTVTEyp0oL9QRcLaO8SmeVOunOqm
 JCGKLtAvPTbnIKIc4/glswrfVOuIU091VWa+RImzqFjH4QQsmBRZ+zo9Q Q==;
X-CSE-ConnectionGUID: wNzd77pWTb+U/ejX85qDxQ==
X-CSE-MsgGUID: LHOpbIsrRwCgm8eWnnI1Yw==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="16614996"
X-IronPort-AV: E=Sophos;i="6.08,266,1712646000"; d="scan'208";a="16614996"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2024 04:33:59 -0700
X-CSE-ConnectionGUID: ikEWY6p+QLKwROTzw7wC5Q==
X-CSE-MsgGUID: +0BSoXPXReyO3l+F2mRg+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,266,1712646000"; d="scan'208";a="43946950"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Jun 2024 04:33:59 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 26 Jun 2024 04:33:58 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 26 Jun 2024 04:33:58 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 26 Jun 2024 04:33:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kx2uqzwJ/uZtgzzj+1b/3JP3SYf8detM5QQgUYuDoPmR24TXmh84Alwz90B32Qn7vc3WkIWY/1eqpDlkTrIYb/bW4LRzPBsKmnLovDnOkcrgQ0zB+wt025aHT6sGoL9VrfuwqPZmRh96EV51PgaH2NWhgPU8kEU6eXhWicTK0LW+kGinUvBho9V3/9vHfL8vfBMEgvblchH7h16MyVgI52aAHoUNWr1LbidgYI7x/X9RF/QBTbefpwN4Q1PnJKjtxnOeCIrrJfCfdcojGEEiwvZQcOQ3/oGcKnHn4XoXKqlQZ0R0jlIsNAw0FY7eqTDVzmoC+/TjuuOTgYcoDyhqfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kIBGswXsY4o23T04mqn5+ptx4FgyC+n/mw9gQzDGOes=;
 b=aWVtXv8DI81tmE7tmhUbWyw0ktdEPw8flCviMVkPvHK+R1oX4LUo2IUCirOgpiRSVk31r3/z+KkENfUHWNfh5VOrygG15pwKk425tVXB67DP6pKziuTVSMWjNoUwqMa8wDBA+e2CEqxDMmDUtvD1NmgZ6V7QsP3RgHgxf+uoKUWbwLgrqgUBDAns6Sg06tk90LUBM6Vl65UR+roxfIw53COqYKJVpMzNtvJ8OQ4AxHlGd5lO7vpk9SThct0GcgCZaBA/7FmQiLfTUF3DQhBCM38+3DHjylDTWz2LzbG4zDlJXWSiMX20+tRjhpammtKaQ2MUko2n8FF9lI2REdHTXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7864.namprd11.prod.outlook.com (2603:10b6:208:3df::14)
 by MW4PR11MB6714.namprd11.prod.outlook.com (2603:10b6:303:20f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.32; Wed, 26 Jun
 2024 11:33:56 +0000
Received: from IA0PR11MB7864.namprd11.prod.outlook.com
 ([fe80::9333:15de:faa8:4cf9]) by IA0PR11MB7864.namprd11.prod.outlook.com
 ([fe80::9333:15de:faa8:4cf9%2]) with mapi id 15.20.7698.025; Wed, 26 Jun 2024
 11:33:56 +0000
From: "Grzegorzek, Dominik" <dominik.grzegorzek@intel.com>
To: "Piatkowski, Dominik Karol" <dominik.karol.piatkowski@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 2/2] lib/gpu_cmds: Typo fix
Thread-Topic: [PATCH i-g-t 2/2] lib/gpu_cmds: Typo fix
Thread-Index: AQHaxvu4eLwxe57cIk21TYJvRxoe9LHZ63sA
Date: Wed, 26 Jun 2024 11:33:56 +0000
Message-ID: <6b144a0d9a443ab96f972c2251bb2e3d7d1c2a99.camel@intel.com>
References: <20240624113949.6846-1-dominik.karol.piatkowski@intel.com>
 <20240625123142.11550-1-dominik.karol.piatkowski@intel.com>
 <20240625123142.11550-3-dominik.karol.piatkowski@intel.com>
In-Reply-To: <20240625123142.11550-3-dominik.karol.piatkowski@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7864:EE_|MW4PR11MB6714:EE_
x-ms-office365-filtering-correlation-id: ea147038-249e-4ace-44ad-08dc95d3dd4d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230038|366014|376012|1800799022|38070700016;
x-microsoft-antispam-message-info: =?utf-8?B?bDgxTndFbkN2TXBWWmdUMHdlVU9DUUwzQU1pbFVuK2RXNC9yWWpGN3I1dGcv?=
 =?utf-8?B?ZGJ1aU5HRnU4WkRCem5jNkVYQzJnREhPdFVqdGc0TG1qVnJkdU1LY1ZuenJN?=
 =?utf-8?B?NFR6bmp0MWUzcHVWMjlmakdHRTJrbThVcXNENDFrcGsrSkYzRDZnMzFwa29n?=
 =?utf-8?B?WjFjU1AybXVPczlBQU9ZOVk5aXJHOGNvT3dNaTBramZnMythV29ZUFhqY3pI?=
 =?utf-8?B?KzMreThrTEttWFVRamxiRkJkejBxWGFZTHpZSGtMNUN0aGdNMjIrV3JCYzZx?=
 =?utf-8?B?KzZCNXd4Q0Evd1dZOUJNcWQrdXAvUyt3a3pBWExOQXpva3BMK2YrUVV6QXVw?=
 =?utf-8?B?R09pV0ZrVnJWZVFGUVFDVHdQY1BUNWEyQ3FpK0M4clF3bHhQVEtCZ2VVRmVp?=
 =?utf-8?B?aUZpak11cm5tV3VJT1JMSit6STIrK3BtVFppbTNNdWFKbDFqeHRJNmNBRXpw?=
 =?utf-8?B?cktiNnN1ZTRlZ2NJWVNuNXFrNzF0L2VJMVNubnhTQlpiWVlVRkFkVXMwaWhs?=
 =?utf-8?B?WW9GQnVVMXoxd0dtc255blE4VXZVZjBiOHFzWWZDeFpRQTZTSTlWOFZNMTJM?=
 =?utf-8?B?OUprWHppWXZyWllzQXh3a2V4Y2RXbHRZaHhoUWJaaEdNMld4YVJ2SDJBVEd2?=
 =?utf-8?B?dVF3VkFROVBxd1QvbkpaRTNXcXczd0pHOG42aTJjSmdjOGZoT0owZXlRaENt?=
 =?utf-8?B?blIvK2tUbGx1N1paL3dLNUF6ZHN3YzN2d2U3ZEQ4YVpDbVpRd3AxQnVCMHU1?=
 =?utf-8?B?MExOQzdqVDQ4YytBNlhDa1Evam94eFZiQjliSnFkeWxISFc1MWxrSjhxMkhj?=
 =?utf-8?B?dVFhUlp1WHpIQ1k5UCtGWkZ2UWJJZmJYWlpxS29wem55ZStDWWd5UmFXSlFU?=
 =?utf-8?B?akY4UW5YTUduS3lKSFdFQUNnclFmNG52VytIajRjS3RzWEc3aTlaaGMyYnYy?=
 =?utf-8?B?T2VmUTc3YVBmWk8rNUF3OHFYK3JHZExnOXBjeURJNjR5T2FCTVNUN2xEc2Vi?=
 =?utf-8?B?eXVKVFAyWXphT2UrK1ZuSkcwWWt6cUNvaTFINmZkSDJQYnlnUUhJNkM2ZUJ5?=
 =?utf-8?B?QmJQbVJmdjBvRXNsR0FFNlZBWXNUZGpzaEoyUjk5WlZCUGlpdjlqd28ySzJI?=
 =?utf-8?B?M25ORCt6NHhPUktXSHNpLzlCN3Zmd2ZSOE9ucVZtNUhFUnJ1RXJZbllHQVZn?=
 =?utf-8?B?QkpFeFEyRTNSNkpyckFJNGdnNldCemZOVWhlcnV3VHV4cHBvWVhocFhZVkE4?=
 =?utf-8?B?akNsMVRZc1k5ejVxTkVqbW1BbmxKdGlYMkpPZU1VRnBQK1pDVWx1QUJSbkdz?=
 =?utf-8?B?VUVGOGs2VHFYbEJNcDZGL2JqTHNHNlY3c0J3VXBFbnh4WjlKbU41WEhGQXZE?=
 =?utf-8?B?ZlVyRjZmOGZ4bTlFTkRLd3Zsd0lnOXpIaXRXM1lJSkY4YUxRVFpsMHhzVkhD?=
 =?utf-8?B?K3RJR1ZTMktud1B0T1FkMXkvVThUNnNjVHBheTBuVmVSOW5LNWtDcVAzVnNM?=
 =?utf-8?B?WWY0THRJcUNwWkNwMW01QTkzN3VKUEdCRWR6MnVKODJ6V0kvZTVLZll2VjlC?=
 =?utf-8?B?dkV0dWtYc0Y1Z1hpNUlkY0NKbDBxTXorbS8zMVg5SjVyaGZUcENPanJNaE43?=
 =?utf-8?B?OG0vSG5DWmZNYm9QbmZmVysvNTM1S3RPZzNmM2tuSnhKWDlDUjJKdGVZTm9C?=
 =?utf-8?B?elp5MENZQjJFNHUyNlpRUlJKK0VBZWI5cEp1UFVSb2NQYzY0bDZUa3F3OUFo?=
 =?utf-8?B?VFRhWDJncWthdGVnaGRLbWZyeVJyOHJXL3lBQnVVd3VsZUZldjI1aEN0ckZM?=
 =?utf-8?Q?REums7mZpkG/wfRRNocPPCUCOUzsNURTiIReA=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7864.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230038)(366014)(376012)(1800799022)(38070700016); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NGFjQWloWGlJYzUwcFUrNFBCNVZ5Wm51WFl0bkQ0dTUvditHSFZ4Snp0ZDBW?=
 =?utf-8?B?MHNjQ2xrRVp4TElsanVuWEdIYUlybzV5Y3UzYmVnWXZtUktNQjNBUmMzWExY?=
 =?utf-8?B?dVpYclV2dGRpOFRIL1NCTFRWbEdTbkorRDJUVUVzMXpEL0c1WEpvVkxQSVdE?=
 =?utf-8?B?N3dRZlNRcmxoOERoblZiZE11Smt6V2NQT1F4U2FrclZUS3I3NzhlZ3JqaEJh?=
 =?utf-8?B?N1g4ZXExa2U1Rlo5d1I0MzFjeVViM1huTi94QURudDFyWEg0R1hKeHgzd2lD?=
 =?utf-8?B?T1REVkpCNENuTG52RnNFRyttQXRweXdEVHE4TjUvYldwbTB0dGZRVGxyRzFG?=
 =?utf-8?B?djZ5WWowZkdXV3VDang4VGFRemtHQjk5U0p2bzRTOHpqTldyQTl0UTNuVU1Z?=
 =?utf-8?B?RHFSVGc5VzQ4WGw0YjlqKytQMDNpaW4rOGpZL3E3U1E5aHJFc1ZVdFZseHRQ?=
 =?utf-8?B?TGU4bmUweWw0TjJZZkRuQzd5UjVSVDd4MjdndGk1VFI2RzNGdSs3NGg2Z2Iv?=
 =?utf-8?B?VnFlSk02dDdrRkNkV25RMXR5RjVWOWdycUZmZ1VRT1dydStjRmxOQVpFQXI0?=
 =?utf-8?B?YXp3ZVg2bW0yQzRaZy96SzFOcnhTSU1GSWtoR2I5ZXR5bGh0M01sejc5eXc4?=
 =?utf-8?B?M3pqbWptRFV5STgvR2NaUEJxdUhSZzh0ejFSVFZZM2pQOFIrUlNEMmlRZHNX?=
 =?utf-8?B?Z1dGSDNYdG1kT2N2b3IzMDlsQTNVVUdYUjJzRURvK1pBVUQ0QzVBQVYvZTZo?=
 =?utf-8?B?YzZDdVBBQ1dLWWVWWWJiTXljL3RyTHE5elltSkd6QkIyZ0R4d25PKzd5STNo?=
 =?utf-8?B?Uk5yZlJ4MjNLdlhIWkdRd1FicmZEZW91NlZ1K0F6Q3FmQjNGbEJlVDFPSmFt?=
 =?utf-8?B?SVdOSWFudk5mbG40RC8wSmQ5SkNQM1dzZWpOV29LN2JueTQ5THFMUnBGa2c0?=
 =?utf-8?B?SEtZOWhVSzJJU1A3b2M1R1FWT0krUXZLakxTNjUva3lWZnhqbDBJemloUWNG?=
 =?utf-8?B?c2t1S3VJdTFCL0dEeWpKaVZhYncwczRuUFBzK0dvSzFEQStXVHcvcGwvSENC?=
 =?utf-8?B?TFJvZ0pxQ3MyZW5XdlJNcTU0QlowZDdjaXFiS1FoR21WQURMSmNaTjJxREd2?=
 =?utf-8?B?U3FDL04rMDA0UlcyS2pvN0N1aXUrTW1BZDRsQUpJWTVNMWlwaWNDdHNJc3Bs?=
 =?utf-8?B?cnJZcG00M3E1MlUrREtseXVFM0hVY1k5ZFFMY1ZoQTdDU2ZkL21ZQ0pxOVVQ?=
 =?utf-8?B?VFUyaHRyOFhHa0FXQjhrSVdKdU1wRlh2S3BzOWM5dVo3UWRHR3VOL2hhZ3pG?=
 =?utf-8?B?OVdScXR2Q2VSMU9DUVpmQ2pnamhXY3J5SUZISmZLMGRTd3kvbDArQUw2MmRu?=
 =?utf-8?B?aE5sYlRYcnhWdW53b016T1ExT2RLdXBIOXZiaWV4QTJYbWJUdkJndzF5VnZS?=
 =?utf-8?B?Q2dzRktqVVJ0K2xkUkJENTZwZ3NZQzBkQ3dKTFN2KzhaK1YxU2svQkF5TUJp?=
 =?utf-8?B?MW4xTHQ5TG1rVkw0a216WXg5U3lHZ2t1RWNvL2tieEpKbUgxR0o0NitmNWFN?=
 =?utf-8?B?eVFSTlVxVW9kYStMU2g3YVlnUjJpRVJTLzV5Wlp0TC93b3dMMnJXaTFZNXdM?=
 =?utf-8?B?citnK3VLTllkRENRMkVpMnJ5ZThyQXdOZG5xUzI1WDZLTHZreklTZTVQYmFJ?=
 =?utf-8?B?ZENkaFU5MEhUNVZ0enBDUUV3TXFubjd2akR0QVYxTk1ZOTVnUVBmUFY4ZjY4?=
 =?utf-8?B?ek9temVHTDNYbDdxREFBYUp2bmREbUJJNm5pMnpqYXhEUXpkVjhFa2piRE9X?=
 =?utf-8?B?NDk0dGdpOERuSHBEcVJjelBSV3J4ai9LRzIxUC9Jc3ZCMnFYVUpQRmM3YzRJ?=
 =?utf-8?B?cEVLbWtieUg2MlE3RTVtSkV2MUpWekM2MVhMN2dSNUlkY3o3aFhTZFE2b1d5?=
 =?utf-8?B?QkpaVFc0ZE93TkJBQ3NaZS9NMm92aGovQ2V0VW1IakF2aDZDQ1JjUUZkaUtE?=
 =?utf-8?B?cGp1dUI5cG50YURVYmswbHdJQXllWUFXTTJyMEpjY2RneFVHZUlWQmJOM1Bl?=
 =?utf-8?B?emlBeDI1RGhyS0tocFV1amk0TGxNdEttQk9KZUVPN2VrUEJ0UWkrd3FZRTM4?=
 =?utf-8?B?NHZWQXFEdkxiQms1TldDTFlmcjFBQXRaK2VWdUY1cDFYUjNLRUJLRjJicm1z?=
 =?utf-8?Q?jT5BgWvcEYg7vp7QNapAw2U=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BF479056B5F5C7459EDAC7E9407AB7E1@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7864.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea147038-249e-4ace-44ad-08dc95d3dd4d
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jun 2024 11:33:56.2745 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZeJKIZyA9wIa4SipB7h72X7aDtQg8+IYlRYWsSj6NtwKITc0HX9ZC85rxR2Q/JaIiYcYDyr7FYYIxrVAORmYf5yTS8FCOglkxqlg9YUq4GM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6714
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

QWNrZWQtYnk6IERvbWluaWsgR3J6ZWdvcnplayA8ZG9taW5pay5ncnplZ29yemVrQGludGVsLmNv
bT4NCg0KT24gVHVlLCAyMDI0LTA2LTI1IGF0IDE0OjMxICswMjAwLCBEb21pbmlrIEthcm9sIFBp
YXRrb3dza2kgd3JvdGU6DQo+IEZpeGVkIHR5cG8gaW4gZGVzY3JpcHRpb24gb2Ygb25lIG9mIHRo
ZSBkd29yZHMgaW4NCj4geGVocF9lbWl0X3N0YXRlX2Jhc2VfYWRkcmVzcy4NCj4gDQo+IFNpZ25l
ZC1vZmYtYnk6IERvbWluaWsgS2Fyb2wgUGnEhXRrb3dza2kgPGRvbWluaWsua2Fyb2wucGlhdGtv
d3NraUBpbnRlbC5jb20+DQo+IC0tLQ0KPiAgbGliL2dwdV9jbWRzLmMgfCAyICstDQo+ICAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1n
aXQgYS9saWIvZ3B1X2NtZHMuYyBiL2xpYi9ncHVfY21kcy5jDQo+IGluZGV4IDJhNTAyNTA1ZS4u
MmUyOWNjNmM0IDEwMDY0NA0KPiAtLS0gYS9saWIvZ3B1X2NtZHMuYw0KPiArKysgYi9saWIvZ3B1
X2NtZHMuYw0KPiBAQCAtMTAzMiw3ICsxMDMyLDcgQEAgeGVocF9lbWl0X3N0YXRlX2Jhc2VfYWRk
cmVzcyhzdHJ1Y3QgaW50ZWxfYmIgKmliYikNCj4gIAkJaW50ZWxfYmJfb3V0KGliYiwgMCk7DQo+
ICAJZWxzZQ0KPiAgCQlpbnRlbF9iYl9vdXQoaWJiLCAweGZmZmZmMDAwIHwgMSk7DQo+IC0JLyog
aW50cnVjdGlvbiBidWZmZXIgc2l6ZSAqLw0KPiArCS8qIGluc3RydWN0aW9uIGJ1ZmZlciBzaXpl
ICovDQo+ICAJaW50ZWxfYmJfb3V0KGliYiwgQUxJR04oaWJiLT5zaXplLCAxIDw8IDEyKSB8IDEp
OyAgICAgICAgICAgLy9kdzE1DQo+ICANCj4gIAkvKiBCaW5kbGVzcyBzdXJmYWNlIHN0YXRlIGJh
c2UgYWRkcmVzcyAqLw0KDQo=
