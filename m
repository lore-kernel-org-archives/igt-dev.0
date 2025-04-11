Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B259C369A8
	for <igt-dev@archiver.kernel.org>; Fri, 11 Apr 2025 10:58:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D11D710EB6C;
	Fri, 11 Apr 2025 10:58:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HZ6/qCWj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5401E10EB6C
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Apr 2025 10:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744369092; x=1775905092;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=T5Ii3JkLoQ2dySvONubg4RrqNjvBKqIdSxRKYZhk3xE=;
 b=HZ6/qCWjHHQPO5omCEeInL4hKxeNN57tW7h3HXFGDjYBVkekpTe1Jrsb
 Moc2LEMa11g9tU24hdaUTd9qtzPsvIEh8x98D3t8VhopxTRfXMPw2NsZz
 oFKxbqm8+uK0XQbndc7snJ6/KrfOh5DGQCafr/PA1dyuNe19IhC986dEz
 LAPOqwNNKb+j0gadvjaGWiBn/0SLxLZQTKOp5Z4Lybk3wcor7bY+nmvH/
 7TySHxOqeGotva8NG30DptClWWicYvOp2SDUZvzWS9yVbRS4oAnGLiOis
 VG76F0Z5oCruGyGqcQkG+W1tuVUQ5tGoAExZI35uVrqOAwpYJ8Nf/JX7k Q==;
X-CSE-ConnectionGUID: Sedww4VzQyaDNGZ+Gp0YHg==
X-CSE-MsgGUID: fjDKxiR5SdCyO3eoxz+ziw==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="45822334"
X-IronPort-AV: E=Sophos;i="6.15,205,1739865600"; d="scan'208";a="45822334"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2025 03:58:12 -0700
X-CSE-ConnectionGUID: etKCdkYsRimcKadYmmVEAQ==
X-CSE-MsgGUID: /151yl6gTW6WMC+zb61aFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,205,1739865600"; d="scan'208";a="129130395"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2025 03:58:12 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 11 Apr 2025 03:58:11 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 11 Apr 2025 03:58:11 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.42) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 11 Apr 2025 03:58:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qBwv/P+ZeRV6Pkw3LRIi96ScmCky6aL5vj+JOBYJUV6W3c150xIkZTXlTeNR/HjO9WR82wycusz1iGGYulGlQQUQFRtt3QuHFJ/HaE0/E9dCJk9fI8K8w9tWD/2Ki0DIEeqaUyHli53RoZ+JvsO0l4QbBwwD3OYYty5nQzSPtJY+RPrC2QKfWHU1dB1Nm1E3Uhc626zHrN66tJinSwm/IaFk6OJKDGZvJPgpJaN5siwRmcRCg6FSB3ZXJNS2PGAn+V6wWgRtbzJ/Syug1sICpN4YJPvPCB03vsZBOEmFuEJAaCOQT4B0OpGZmW4iESsfVbRaP2VS+CL1RPSgj52OvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=svrVmOpk43B1X1XBq4djJnfkhjmbcMLWAtwljD+sVKU=;
 b=DrcE6XnmJOrfbkuT2xmJ8P5mlGdED2JkSpavIEHuq99KtEju7+3P72n0O/VVYa9xz+K0vwcpkGMWVk0zsjFG0J+kverqM69OyCOpqaaBt6pqDdRgJEWez4vTlDq1b0B47Hm2ARQMKJS7XGfkzj49XwKNKUA+Qa2yxYfZ+t+mHhJjEYXJUgoMGtpOjxaQffRItAQIZRY/wF6Xun36JXiR07yOtpl9tbTwNLt8EWU6U92ZSNs7cq6kSTHIkJ5/mO1PzQAFQW0IUJwMWVHihLW1KI4PU7gEplVcKWGJyeViOiZSzcSlogcKLCGnWhm9xe9ByGXvv6+jHEcZSU6z7ut9/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 IA1PR11MB6371.namprd11.prod.outlook.com (2603:10b6:208:3ad::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8632.22; Fri, 11 Apr 2025 10:58:09 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%6]) with mapi id 15.20.8632.025; Fri, 11 Apr 2025
 10:58:08 +0000
Message-ID: <52b194b8-9e12-4228-93da-23d6c02dd34f@intel.com>
Date: Fri, 11 Apr 2025 16:28:00 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/2] lib/igt_configfs: Add library for configfs
To: Louis Chauvet <louis.chauvet@bootlin.com>, <igt-dev@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <lucas.demarchi@intel.com>,
 <rodrigo.vivi@intel.com>, <kamil.konieczny@linux.intel.com>,
 <katarzyna.piecielska@intel.com>, =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?=
 <jose.exposito89@gmail.com>
References: <20250410060727.1857299-1-riana.tauro@intel.com>
 <20250410060727.1857299-2-riana.tauro@intel.com>
 <b1240c51-3a5c-4e5d-b6b7-afd14edbc6fc@bootlin.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <b1240c51-3a5c-4e5d-b6b7-afd14edbc6fc@bootlin.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0067.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::13) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|IA1PR11MB6371:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e7536ac-1081-41e4-213e-08dd78e7be55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dkVwUkxkS0J3aTlZNVE1VCtBSEdnWE9waHJ3bjFGME9UMWFGbVNNb21UVjFs?=
 =?utf-8?B?dGF1WUZhdG5xWGErSU9sRERqYUk0a2VFZGhVUXovSW55MFFsY3NkbXEwdFRZ?=
 =?utf-8?B?RFlZbVduSWlhS2JjU2hCendSeWFRMkZvOFpIck5SRDRGQkRxaEQrbzZONXZr?=
 =?utf-8?B?MmZwbllldmtYb1Y3K2Ivay9Td0dodWxydEVuWHZaUmVPWTVxay9lTXF1SENM?=
 =?utf-8?B?WUJTaEdLUm4xTGpKNk5UekR5YXdpUXlKblg4Wnc0THRBZGNzZE40VWRqdHVW?=
 =?utf-8?B?bVU1K2Eybk83VVhEOTN3V3FrTGN4NWx2U2VkcThiazMwYmd1UkxoN2cyZmVw?=
 =?utf-8?B?OUdnYi9uR1ZqTWU5cXRBODk3cldaWm9oWG1rOHBXUU9DblBjWUhtSjRyMUhJ?=
 =?utf-8?B?bEE4cUZ6Tk5GMzF0WDBtcTNhdERQbW9HN1Z4K00rYlJnSjJpWldEL2xRemVY?=
 =?utf-8?B?eGc1aHBzYmhrcnFBTUFmT2hUTnY5dm9wQUFSU0ZZTlMvZFFieHl2RWRGYUZX?=
 =?utf-8?B?dy9oSjNEdHFNNkdBNHpCYWNEZHpaanNGTEZWa2N0WWNGMlpSU0tNajJpc05Q?=
 =?utf-8?B?L2pRa2srYk1QMDdVUGZRdU54aTZwcmY2bU0raGhQK0k5TUlhank0Z25wSkc5?=
 =?utf-8?B?MU5aZ1lFTDRBM0krWUk2NHE4aUJheHpGVTNna3FpZ0ZoYXJveitNVGlMRFNo?=
 =?utf-8?B?dzFxWVBHUmNsM2ZVS2w3RW9EQ1JrTDNtYytMZ0JmQXM1ckpKQ1FubjlhazdZ?=
 =?utf-8?B?eGQzRkpraXpONXVZUFJOSzRJeVFZVm1kZm5xN0JmNGF5WDAvMTFZckxLam01?=
 =?utf-8?B?aVJUWkhSUXZsU0hnNktEVkdMekRYR3ZWVU1pVVhYamlWSElyY3NWL0l1b2Vh?=
 =?utf-8?B?V0lEYnN4YlAzTFhIalZiRWdpczF1WnBOVW1WbUdYVkR6U2dwZ093a2FNa0NJ?=
 =?utf-8?B?Y1VKczRoMlRsTktmUEd2ZFRSbVZHeG9adnN5NXV4eGl4UXRyY2V5WGtZK0w5?=
 =?utf-8?B?dS9NM2Zlc08xeU1zSmZkNU5CbkNUTlZiaHlDbFhLei8xVEo2WHVUUmZGemNK?=
 =?utf-8?B?cXVLMTE1Q296SjVPZ3ZadVNmSHJmK3ZZS2ZmR1FQZGRyVWlKUmUvSjZIZEF3?=
 =?utf-8?B?aUpaM0sySWxyNktFbFBqNVNocWdtdklISk9TZUpVdXQvbjE4VFRMT1pSaENJ?=
 =?utf-8?B?cGlaaTE3UlorbE5UZUQ4WDhTcURxM3NJMTcyM0x3L2l6eHpBZmVMRWtkdHZI?=
 =?utf-8?B?d3BqTitFSDYxbzVSWUpQUjRZTjRvb1JsZnZTNUNmS1B3d21makl3MmgrbUVH?=
 =?utf-8?B?S2hJWFlUSTYrcVNLaEgrKzFYOWQ0anA4aUdjTElXemRKT3VrTndRd0hFNG53?=
 =?utf-8?B?RFF2a3RtZ2h5djdCaGdWMkVTYlY2dkhNME00TFdJaklTMHZ6TnE2TzNQNDNO?=
 =?utf-8?B?R1JrVE9tZVFxeml1RW03WlVON3FsdUF4TUZ6OTlyOGowT3Vjc09YS01rTENT?=
 =?utf-8?B?WENDNHRXOEhYTHJ4RGh1Y3RxUUNpRTNBcmtpT1ViTnNqZ3RCQ01meWNmR0xG?=
 =?utf-8?B?QW9QY3JUdXdWdEdQSWdUak1vSGhWUDFzS3hjWklaOUtiTFNhQ1JvS2lObzht?=
 =?utf-8?B?M3RtN0hJYTZVL1p1QVd2UmZseUFpK3c2eThYaVM2MWFmOWtaRmtBVWR6djNN?=
 =?utf-8?B?Mk1VOVRyOTFNRGZJTUcrZVRqbFYzLzd4eUp2T1lOQ21COVRJb2k2eTA3eDZ1?=
 =?utf-8?B?eFBReFM1NEkzMHZzaGpJMXV1dUdBODlBYmZmQWlYVlJpbHR0NEd0SDhBNExl?=
 =?utf-8?B?cU12Rkh4c1NnNGcxOU0rZ21od1haTDhVZ244a2ZNOGR3ZVBVSXZqa0ZJRjFY?=
 =?utf-8?B?LzU4a0ZVQklRNTBPb1E2UDZYWkxBSlkzRCtwTm9kcTEzZTBlU0QzS0k0dXNs?=
 =?utf-8?Q?/n7rm7CDb0NmAwuXxk7bKvbHUDFXCAlp?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SGh5VUU1Q1Y2UnhSVHVLZGJ4STdaZ1BIa25uNlBxcVVGWGZZb1N4d2svWHBr?=
 =?utf-8?B?ZlkyZHo0K3hqUHZKV0JReXVxeGl3TXF1UnBlM1l1MnZBc1VUSFRZT2dVWGd6?=
 =?utf-8?B?VlFjdE9hNmJTam9FZFU3Q0ZNUFQrcys2MXd4eE9UMFhNdWRzRFJ1K2dQYWx4?=
 =?utf-8?B?N05ySzM1eWtHTStSRnU2Ni9mUTFZTEdWMVdkNWtwbXVnY3RoQXZId3Izemcw?=
 =?utf-8?B?M0JKb1RyZ0VOdnFCMXo3R2ZrTDZ4aTgwcVVZZkVaVFVqbjBrUVFUTjQvRno0?=
 =?utf-8?B?cWlCWmJDeGlTZU5jaHNLaUdxSXhyOVM4YkpudEwwZnM0aFc3SGhuMUU3ZDdT?=
 =?utf-8?B?NG1HMFpJckl3ZEJoUnM0Q1A3TEZmMGRFcjZmK0pOOTloNEVzUjd1QVhNazBB?=
 =?utf-8?B?NlFMSW9lZ1JLTUl3ZUZ4dFNSVkE2MWdZTzlPK0h3U3NkU0RXNS9QSzlwUXVq?=
 =?utf-8?B?MTJkTDZOcTFEWGxnYTJmZ1JyODlnSlo0UGpzZWE4dFBtU2s4QnZkTTd6VWUw?=
 =?utf-8?B?eENMZXY0WUpXcmUrREhuTlluZ3VVVFJFd0NYclFkVlBJTmZqSU0rVjlVY01M?=
 =?utf-8?B?U2FoZkROSzA3QlRJd3Z3eW85UzNFaEZlcU56QnNlL2N1Tk9MeFhGS20ycUVz?=
 =?utf-8?B?dGp5NDFLTU1kVGpFL3o0TUQrNTVpL0ErbFZ6cnRzTXRINk9FU2tCRk9KWmVJ?=
 =?utf-8?B?NFoxQVA0NWNaazFYSlFWVk5aZEhCUXFmZUpONWtMYmNRS2dOZmJCbElYMFdO?=
 =?utf-8?B?Zkh1VjY2N2xudVBJR1FLcXpYTmlBZFN3dTEzcitMaU94cXdoMVlLckdKYUxT?=
 =?utf-8?B?am1MbGgzWEN2dm1SQnpSOUNUdFc5OU9lQlhGekZNajVTYjgzK3dzdnFRVldI?=
 =?utf-8?B?YzRIZWVBcGhUK3h2c2xVR0VnQ0lhZE90a3l6Ylk3S0V6SlJuUHJuRHpsekZ6?=
 =?utf-8?B?b3I2UUVTWVREdTh5VEdoaUhQeW9FMkZDdFB1YjB1NFZnbXlDZ1JJWnoySi9U?=
 =?utf-8?B?cy9pTU5Bc2dIQVFEcU0vdTdibDZ4ZmpEZHFtM1FmZnYxMUZUemszZUtEcG15?=
 =?utf-8?B?UEZmVlRIblNYWCs3UGJmOVM1WVlVR0h1aitWQkpDdGJYcU1CdkJJM0J4ZTZq?=
 =?utf-8?B?VjJRdzdPbXJMMHJWZmxJWi9QZW15SHdiNHIvUWRYMnlTQi80dU54TmFFMXRX?=
 =?utf-8?B?Tjg0NjBhSFFodlBWN1FCRGt1Qzg0ckJGS1VCMktST3ZJK1kvRDFwT2hnaHBn?=
 =?utf-8?B?MUN4TlNaSEtjSzdFTXNMZFNTaXR0SmdvUUdWTUc4aFRUOU8rUkR1a0x6Nm5O?=
 =?utf-8?B?UjZicVRSZ0Z4QlFZZVlNTlNQaVJiTm0rcTNPM1NFbzBhL0YvRjhuZ3RucjRU?=
 =?utf-8?B?MTlsdVJ2SUZySnhpcEsvSFZhVXdDbVpFdnBqYkt3MDNZSmcxYkw0dFdsVFVL?=
 =?utf-8?B?TURDMTlIay9jbWZmUVNLUXBHcURTWm5SSHhqNmFmSEN5c0xMUmYwL1MwWkFR?=
 =?utf-8?B?bmlHTGVGZk5vMysyZFVTMnp6b0JoL0ZXVHhGRDlSRTNtYnB1U0RFMVBwb1l0?=
 =?utf-8?B?VVVjbE9kdy9sNHE2YWlPRU5kN2NMWXQ0UWRnN3JhcThZcUdBRlVXRGJkMmY4?=
 =?utf-8?B?aHJzSS96TGRUSUZZNVpReG0yKzVOZGU3NDJKbkJMaFJLSmFDQTdkejloN1JM?=
 =?utf-8?B?T09EcGJLeEZxSGlreHVtbXU4empSajZPU3JDZWgwUzNLOFp5dzNVU1pZS0V0?=
 =?utf-8?B?ZUpCZHhSTkRBRWJwUndRZU1SckpJMkhVdG8xMmp4NDdRTEcwRUoybVkxNnRy?=
 =?utf-8?B?RkNrcGZ5V2JvVWF0ZzhRdmpkdkFyM0hhMFFscWduOElTbWlYU1pTdHI0YU90?=
 =?utf-8?B?bXEzVlZoei9EK1BCU1J4UlkrS0ZPVW1NV2VHYmpPL2w0dW9KUUUyVW9SWmFB?=
 =?utf-8?B?dUVvWXJWdS8zdUlDMHdIZk9VZFNXTXR2b2JkRjI4MEhUZ1Vzeno5cmM0S2tw?=
 =?utf-8?B?QTZ1c1ZVWHc2cnpUZVVlbm0wd21uMjdGa3ZTK0pPUXRZdmhTT0I3L0RyUzVC?=
 =?utf-8?B?MFJqTzJCcjBMbXZSN0p3T1Q3ckIrWDZmS1ZnRkppME40Ukp5YUpuSDcvZ3lB?=
 =?utf-8?Q?3mTjm/fPOAX7wMAZfuGOot88f?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e7536ac-1081-41e4-213e-08dd78e7be55
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 10:58:08.6121 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MVTNb6pDk866noefuSFijKqaGViH0n3jG+PSADQURmLkqlIEDewDEymZFmZmEdh95tbZUCsG/o1AAehS+SC2RA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6371
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

Hi Louis

On 4/11/2025 1:23 PM, Louis Chauvet wrote:
> Hi Riana,
> 
> Le 10/04/2025 à 08:07, Riana Tauro a écrit :
>> Add library functions to open configfs and create
>> and remove configfs directories.
> 
> Can you take a look at [1], something similar was proposed few weeks 
> ago? The main difference is that [1] checks that /sys/kernel/config is 
> actually a mount point.
I hadn't looked at this. Thank you for the link

@Jose is this close to merge? If not, can i send [2] and [3] as part of 
this series?

[2]https://lore.kernel.org/all/20250218165011.9123-3-jose.exposito89@gmail.com/
[3]https://lore.kernel.org/all/20250218165011.9123-4-jose.exposito89@gmail.com/> 

> +Cc: José Exposito
> 
> [1]:https://lore.kernel.org/all/20250218165011.9123-4- 
> jose.exposito89@gmail.com/
> 
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>>   lib/igt_configfs.c | 88 ++++++++++++++++++++++++++++++++++++++++++++++
>>   lib/igt_configfs.h | 13 +++++++
>>   lib/meson.build    |  1 +
>>   3 files changed, 102 insertions(+)
>>   create mode 100644 lib/igt_configfs.c
>>   create mode 100644 lib/igt_configfs.h
>>
>> diff --git a/lib/igt_configfs.c b/lib/igt_configfs.c
>> new file mode 100644
>> index 000000000..57d59f1c4
>> --- /dev/null
>> +++ b/lib/igt_configfs.c
>> @@ -0,0 +1,88 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2025 Intel Corporation
>> + */
>> +#include <sys/mount.h>
>> +#include <sys/stat.h>
>> +
>> +#include <errno.h>
>> +#include <fcntl.h>
>> +#include <limits.h>
>> +
>> +#include "igt_configfs.h"
>> +#include "igt_core.h"
>> +
>> +static const char *igt_configfs_mount(void)
>> +{
>> +    struct stat st;
>> +
>> +    if (stat("/sys/kernel/debug", &st) == 0)
>> +        return "/sys/kernel/config";
>> +
>> +    if (mount("none", "/sys/kernel/config", "configfs", 0, 0))
>> +        return NULL;
>> +
>> +    return "/sys/kernel/config";
>> +}
>> +
>> +/**
>> + * igt_configfs_open: open configfs path
>> + * @name: name of the configfs directory
>> + *
>> + * Opens the configfs directory corresponding to the name
>> + *
>> + * Returns:
>> + * The directory fd, or -1 on failure.
>> + */
>> +int igt_configfs_open(const char *name)
>> +{
>> +    char path[PATH_MAX];
>> +    const char *configfs_path;
>> +
>> +    configfs_path = igt_configfs_mount();
>> +    igt_assert(configfs_path);
>> +
>> +    snprintf(path, sizeof(path), "%s/%s", configfs_path, name);
>> +
>> +    return open(path, O_RDONLY);
>> +}
> 
> The usage of file descriptors for folders is nice here!
> 
> @José, I think this may reduce the complexity of the vkms tests. At 
> least it will avoid having snprintf(%s/%s, vkms_root, vkms_item). What 
> do you think?
> 
>> +
>> +/**
>> + * igt_configfs_create_directory: creates configfs group
>> + * @fd: fd of configfs parent directory
>> + * @name: name of the directory to create
>> + *
>> + * creates a directory under configfs parent directory
>> + *
>> + * Returns: 0 on success, -errno otherwise
> 
> This seems wrong, as the function returns a file descriptor, did I miss 
> something?
> Missed this. Will fix it>> + */
>> +int igt_configfs_create_directory(int fd, const char *name)
>> +{
>> +    int ret;
>> +    int dirfd;
>> +
>> +    ret = mkdirat(fd, name, 0755);
>> +    if (ret)
>> +        return -errno;
>> +
>> +    dirfd = openat(fd, name, O_DIRECTORY);
>> +    if (dirfd < 0)
>> +        return -errno;
>> +
>> +    return dirfd;
>> +}
>> +
>> +/**
>> + * igt_configfs_remove_directory: removes configfs group
>> + * @fd: fd of configfs parent directory
>> + * @name: name of directory to create
>> + *
>> + * removes directory under configfs parent directory
>> + */
>> +void igt_configfs_remove_directory(int fd, const char *name)
>> +{
>> +    int ret = unlinkat(fd, name, AT_REMOVEDIR);
>> +
>> +    if (ret)
>> +        igt_warn("Unable to remove %s directory: %s\n", name, 
>> strerror(errno));
>> +}
> 
> I completely understand the point of those helpers, but I don't think 
> they are configfs-specific. The file descriptor is passed by argument, 
> so you could use it for any interface (configfs, debugfs, sysfs...).
> 
> I don't see any igt_fs.c, do you think it beneficial to create such file?

I thought of calling the igt_configfs_open here but that would not work 
for nested configfs directories.

This could be moved to igt_io and that can be renamed to igt_fs as that 
has only file read and write calls

Thank you
Riana Tauro>
> @José, do you think it make sense to also reuse igt_sysfs helpers for 
> the VKMS tests? (igt_sysfs_get/set_s32/u32/boolean only use a directory 
> fd + path, if you decide to use fd for vkms, it will avoid code 
> duplication)
> 
> Thanks a lot Riana for this implementation and new ideas.
> 
> Louis Chauvet
> 
>> diff --git a/lib/igt_configfs.h b/lib/igt_configfs.h
>> new file mode 100644
>> index 000000000..d839db49a
>> --- /dev/null
>> +++ b/lib/igt_configfs.h
>> @@ -0,0 +1,13 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2025 Intel Corporation
>> + */
>> +
>> +#ifndef IGT_CONFIGFS_H
>> +#define IGT_CONFIGFS_H
>> +
>> +int igt_configfs_open(const char *name);
>> +int igt_configfs_create_directory(int fd, const char *name);
>> +void igt_configfs_remove_directory(int fd, const char *name);
>> +
>> +#endif /* IGT_CONFIGFS_H */
>> diff --git a/lib/meson.build b/lib/meson.build
>> index d7bb72c57..f087947e7 100644
>> --- a/lib/meson.build
>> +++ b/lib/meson.build
>> @@ -19,6 +19,7 @@ lib_sources = [
>>       'igt_collection.c',
>>       'igt_color_encoding.c',
>>       'igt_facts.c',
>> +    'igt_configfs.c',
>>       'igt_crc.c',
>>       'igt_debugfs.c',
>>       'igt_device.c',
> 

