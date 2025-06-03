Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 824CEC5AD49
	for <igt-dev@archiver.kernel.org>; Tue,  3 Jun 2025 03:55:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BBEE10E5D4;
	Tue,  3 Jun 2025 03:55:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TUAGn6Dz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E73C010E5D3
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Jun 2025 03:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748922907; x=1780458907;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=NXy+sdJ0//I8hPxGi09SUr7age3XPoIHJuifjknUY7o=;
 b=TUAGn6DzN3XAfZFiXc3b+L2VmbGjLROvywU8+hpjUbh2D0QSfevVSpms
 1VpuXCEDfW63IUhf0s18rSrrdztgoOAJ1JnklR5JHW6zZAjhu5EihNjSD
 MigBsgh3X+4YX+QujjJVD8/AL9uCN7yZqw6dWFdz23GQW2oFOL34O7YTB
 SB7RvzKTbGUVJJfUIje1GryuDdchWD1NcHsi1+Ei+RaiutdpnuWBvWUy7
 iYvAgRNxY08HGWDSW6deM5qXbWol5XDOOhLuwsCEXFfBgNEbsldiMXUOx
 As3d5buoC93lzmYo43/wLEp2xKcl4Th43ED/iWMzD8z6G0e5W6tg1uG21 A==;
X-CSE-ConnectionGUID: SfCozDpjTDGEWfzDXGHC4Q==
X-CSE-MsgGUID: cQRyM/HyTzSJn4e2/nDLhw==
X-IronPort-AV: E=McAfee;i="6700,10204,11451"; a="62338002"
X-IronPort-AV: E=Sophos;i="6.16,205,1744095600"; d="scan'208";a="62338002"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2025 20:55:07 -0700
X-CSE-ConnectionGUID: ZyR2HsaKRACm9WpcA9aCsA==
X-CSE-MsgGUID: lN7aoktTTJu9B03p2wr7cQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,205,1744095600"; d="scan'208";a="144603968"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2025 20:55:06 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 2 Jun 2025 20:55:05 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 2 Jun 2025 20:55:05 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.79)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Mon, 2 Jun 2025 20:55:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bqxi+FdtvlVaedrwKyvlXyhMINoL3MPlAqK6lm/vhWRzv9kl1plBEPYntgDlVhn8xoXi06zOogDbkJO0hXhJ53vv+zZvpsJTEOI/Oik/wfjcUR4Y/FJ2EZci+vrx2eFgIGroWl0V3gZP4wijP99IJDdwsskXZg+ORqX3C+uKzb8JZPi9UDRMJJN3gzwW+HsXxZZMWnaWpGVPBgwFyGHnvi1SO36sQMrBhV6wgS6f8pLVzkRCKCGGEvVY7eIBkzbBJa5+UUC4/o5HxQnbKcG8Z3oJopSRqGbYtkQpU7D1ZXX4UX/N360gXGSLU9HznPQX1dJKqzlLN+98FqiXcQHMow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jzwMypnPhvfmS2vfaFR6M7ed06FfZPDIlIYkQCX92S0=;
 b=qPH7yHrcv8jdrcTFKC2xKFXsWk1LRv4EgS7ebpgpsZ5v03t9Qo+AH/VUbu2RgemqtpESx9qwJMg8p/DkOYgIVwbvdNF9Xuguti61dKGXJRbvC/caGU1R5rUx0JV5mxHpcl0fwtu3+JQP3Fmmv4iuo6qjPC6xaKGwlQZPnOi3ezs3XKyDbC1Cdmq4s8y5rtP3REcJeZHeSx/NoG1hh0xvko0awgnkFEV/Bg2KQrTg1UlFlfJaO+q1wfas1Wq0Sp92lLABdGEoELQ9epyF0ZMHM2/Q+LzgAFf1SPmvo2oiMykpuJRcvOLmLqhD71d3ZKeyWGAcnTxkjHK2o6Dmmitm9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN6PR11MB2704.namprd11.prod.outlook.com (2603:10b6:805:53::11)
 by SJ0PR11MB5101.namprd11.prod.outlook.com (2603:10b6:a03:2dc::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Tue, 3 Jun
 2025 03:55:03 +0000
Received: from SN6PR11MB2704.namprd11.prod.outlook.com
 ([fe80::513d:aaea:b097:afb5]) by SN6PR11MB2704.namprd11.prod.outlook.com
 ([fe80::513d:aaea:b097:afb5%3]) with mapi id 15.20.8769.037; Tue, 3 Jun 2025
 03:55:03 +0000
Message-ID: <66cb7338-0bac-418b-9c1d-5b711b4ad301@intel.com>
Date: Tue, 3 Jun 2025 09:24:55 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 2/2] tests/kms_content_protection: Whitelist
 check for panel support
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>, "Thasleem, Mohammed"
 <mohammed.thasleem@intel.com>, "Konieczny, Kamil" <kamil.konieczny@intel.com>
References: <20250529015522.298460-1-santhosh.reddy.guddati@intel.com>
 <20250529015522.298460-3-santhosh.reddy.guddati@intel.com>
 <SN7PR11MB67506B911CAEE753F97D535DE366A@SN7PR11MB6750.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
In-Reply-To: <SN7PR11MB67506B911CAEE753F97D535DE366A@SN7PR11MB6750.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR06CA0248.apcprd06.prod.outlook.com
 (2603:1096:4:ac::32) To SN6PR11MB2704.namprd11.prod.outlook.com
 (2603:10b6:805:53::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR11MB2704:EE_|SJ0PR11MB5101:EE_
X-MS-Office365-Filtering-Correlation-Id: c696b97c-9701-47e4-e78b-08dda2526b5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NEZFaUZBK1hOcldqcW1vanFmTFkzWGNDUXlOL200NUdHTWQzSVZhVXJMRURz?=
 =?utf-8?B?TWFibUN6MFBqdmV6Sm5ra3NkMmc2alMyRlRZVHhPL0hFZmIvTC9PNnJVN3FI?=
 =?utf-8?B?Zk10cU90bi9xa2tSb2pVS3FhRG9BcWlJbE5TTXhxbDB0aFB3VWVZT1ZQSWZz?=
 =?utf-8?B?Zll6TkY1UU8wa1ZtNWVVeGhLZTJRdU1pMEs5RVdHU0VGbFR3bWU0RlZPcURL?=
 =?utf-8?B?b1ljZHR4NU5pMFh4Zkc3cjZjVURUY0JFcG94UGxnZUlIam9yMjRxNzkrdE1B?=
 =?utf-8?B?L0xnUS9qZzMwMWswY0s2MUhZNUE4M1BEb3pYWk1BNHRVa3pDVGowMlVJdkJO?=
 =?utf-8?B?aFVucllaeUFVU1ljVW4ydWRVeDZXMzVSaGJqM3hCOXlua2xBa0w1Z3JjclZ2?=
 =?utf-8?B?S1pmY1NmWnVNZXJlWUh6YXBGWmpwK0F1MmFyUDI4SVNlTjN1TmhGKytTdmp5?=
 =?utf-8?B?YmQ3aVd1YnJsWFQ1akpxRHhoK1lBNzk0Nmp0TVFIakRBWmdXUUpyc0VoQUxS?=
 =?utf-8?B?ZjhCcC9zUXZxWUFQSlRqaU1BOGtOcWFKQ283MUEyZWVpN0xjRFAvemIxZlNv?=
 =?utf-8?B?bDZ1ZUNvOC9QTHlMNEl4eUZXcVF5VlhpME5FMUk2TUNOaDM0Ulk3b2xDSkpK?=
 =?utf-8?B?RHNybmtUVzNpR21uUmxCRndyTmNrUTVBQWdKc1YrSXgxSEtVRloxQzBlaWJO?=
 =?utf-8?B?cGtTTlpCOGF1WE1aMWFtSGNMZks2dWg3TWZqY1l5VWVaZW5YSHF4L0Z3Wm9X?=
 =?utf-8?B?MjEwVThvZUk2VE9TelVtcDFrRHBqN0oxd1ZTZnlqTEdTR05Xem15bkI1c01v?=
 =?utf-8?B?YUhRU3RaQktGRWhScGduYlZrak45SzdkdkxCZUNtc24yNFVYTUpzamlMUmRO?=
 =?utf-8?B?VnArcm10eVVBbU9SMEJFN21YWDdnZndCQnJjdWpJcUwwcUgxVUpBRXpyNjU3?=
 =?utf-8?B?TmpkdjN5bmR3REhQbGxtZFBKc20yak9yLyttZ0pFTXV0Wkdla3M0MFhhNVBF?=
 =?utf-8?B?V25XT1drR1RuMzI0akFpMUdPS1Fiei9EYTRnTC8xYkplbjI4TnZwVjh4Q2x5?=
 =?utf-8?B?RWJyMXE3TkJSUGRoakxQQ0pabm4xeFpWQit6U0FGeHVTVmQvYWdseWJMaFNH?=
 =?utf-8?B?Y0pmT2s0QXRGNHAyOWhxUVVoUHNTTVdtRzgvd0JQNmpuZ0huT1ZMWWFVa0Jl?=
 =?utf-8?B?ZGhCMG5PUjJYQlFYblp6ZXJKeHR3andDSHdLZ3haTy9rdDhoTjhYK25Odm1I?=
 =?utf-8?B?SGtZV3hTZHJ0VC9DMWlqQzFXY042R1hXaHg4QzhGUkN2cjVtY1g2WEpUajR1?=
 =?utf-8?B?dVdveDNCd244YU9rMlY2dnEzR2h5QnRvYlJCMWI1b21pMVUvVk43cS92S21t?=
 =?utf-8?B?ZlplbXo0akZJK252ZjZqT1o1enhWN0QvNTlLRENYd2lsZys3TUg4UjFuWkJ4?=
 =?utf-8?B?VGxSYWNxdzZsVDZaR2tVVDg3V0hrTWt4ZWpZUHdCYUd5YXN3a1pZS2Y3NXly?=
 =?utf-8?B?VUZiZFNUZXprblQyeVZ4cWwweG1hMHNlSVh5UkFHZklSRnJQTGJCQjlCdzk2?=
 =?utf-8?B?YW5DMW9ZSUNObGRnYytOaCtBNHFSZUxZdDIxSnBjZTEzNXU1U0h3MlBJU1FB?=
 =?utf-8?B?dHpKVEl0S3c4aitKYmtjZzVHRFdjQnJWajR5Y0MzZEtKcThFWlhCWFRCQnN2?=
 =?utf-8?B?YmlmSTdPc0l2TDJxOGlMMWZBdjJhbEwvL0Z2VStBeE1GajJEWG1QRUJIMEtV?=
 =?utf-8?B?NU5XZzZ4RzVmT0tMVWdldndVelc1V1lKd1lXVzBlKzRUeXFSYnk0RjRORzhV?=
 =?utf-8?B?NWdCdkhMZ2E1OG0xOEZ3MThPb3lLc0duY1FhM3AwZCtXUmNtUlVKRkE4ZFhk?=
 =?utf-8?B?blpnUkwyUTkzRVRoOTZpb1FKSmpYVlhMOUdSYnE3MnlGNldwb2huN1ZBeEhp?=
 =?utf-8?Q?yV7GP6gVeaI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB2704.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dUdqWTlVdGpZUnB1YUtRbG0ySW1wMVlRN2t2WTV1dlJkTlQzSGN5QjdIUURH?=
 =?utf-8?B?UDFWVjVKVU9Ibml5b1dud0RCc0JveEo3eklBUnZBSVBVTzdKRU1DSS9JM0Fr?=
 =?utf-8?B?VE5HVWt4RjFuYnpnMnp6d215eUt0ZTBiTlAyT2pudGVwUWVJZTloS2s4STBs?=
 =?utf-8?B?OVpXOEVjYUh3UDVpRGZTTjdXWElxSGMvekRQaHZZMFN6NmR2WFNSU1ZEVWk5?=
 =?utf-8?B?M2ZxL0R6cXFYNUZqNTM0RWh4QjEyemlpWXlPSDhoRngreXgwK2RvbWNBRTE3?=
 =?utf-8?B?YkQ3ak41UzExNjIra3V0dEQvYkN2b0xOQ20rVkpoVjJRS0V4Y1VNckR3ek0w?=
 =?utf-8?B?QkJnNitvNnpHVnpFZEdURTNxY2JON3NPMSs3dFRMMGpDaXptZXdSRVY3eStM?=
 =?utf-8?B?N1Q5OUt6SXJYQ3lVaWhXNDYyL1FwaXlET0NLb1ZBa1B2cndxZHdIVVZFNHBR?=
 =?utf-8?B?WHY2QmNUeTAzN2NBV2ZKZTA1c1JJMEh4cExFRUovekZ4azgyRzdVMEgxcGtE?=
 =?utf-8?B?Z2VyOXFsb3JmV0JTcW41ZTFWaUd3d2xNK04rUDRPUzRpZEJVZ3ArQjlMcEV6?=
 =?utf-8?B?bXRKeTRZNlkvdTMxVmk2T3ZxMEQyK0NkdWJWL244L09qc3YrNytnUnNxTnhq?=
 =?utf-8?B?V2p2U0czUTd0VXNZR0ZiZDZWVVhpb3Z0SGlBdUJwZDVOZ2Q5MFE5WGZFaFVk?=
 =?utf-8?B?Z2lQOXhiZVdhVDJBZ0tDekNQbnBHak5RRGo4QlJWTVJOWWtKbUZGZjJxaEVQ?=
 =?utf-8?B?aTduSkFNbHpWaHR6TktiNCtGU3FZRVdHZ2FxSHpQcW5BV21aUUI0N0laSms3?=
 =?utf-8?B?eVdKOFQyV3RReXZOT05YNmIxUmhOTXBYSy9FZ3paQ2RtQXJ4QjA0cGd2ZmY4?=
 =?utf-8?B?SlF6Q0d3M0o0bm0yR0hBK3k1c05iT1hhdmR0c3hWT3ZMM00xNFYyQWFsWWdp?=
 =?utf-8?B?WStMcDVXdXFJamdzcE1id2ozaDhEMzhwNUhzNW54akhVZXladG0rSHZyYkxj?=
 =?utf-8?B?bGNaVEJkZjRuY0pvWXB6TGVYdmxNWm9xS2J6NW5GTmtTekJqRnlyVEVPdXA5?=
 =?utf-8?B?M1czREdjeVpoN2NITGxyL0lHN3JndlY3MUlhUUIvNHgvTmY2SG91b1hBZ1Er?=
 =?utf-8?B?cEhYUG4wSnJpTXlqMWhlMGpJUU10ejY5UWVmSGlUblRqUXI4bmRMSHZYSHNu?=
 =?utf-8?B?M0JoZjBrbEhKR05ENFRCTm5OczVxRFYxM28yMWpPYmt2VTNGcG1QWk1wVWlw?=
 =?utf-8?B?NTdXbDNXWStXQy8yT3Z4MkNmbVNpRUZWdTVFaFM2SVlpdU5VWEdlUElLd1cy?=
 =?utf-8?B?Q3hjSWRVdkRGMXkyUm5FaGtpMzRpNDBET2tJQmVxeGJUSFlNb1NjVHAvMTEr?=
 =?utf-8?B?SndQQVR0WHhwQ3lnWEdGZkxsTVQvQWVCZ2VZeHRiMFltNWVabkVqZlZscDdB?=
 =?utf-8?B?dXU2c0hNWFRqL2RHSTl4YXRwdVFNOHNSTVR0Z1RabGFqUWY2UXJwUno1S1o5?=
 =?utf-8?B?Y1NKL2E2RmNkT1FFNDd3aUlINVVENlJoUzlOTjQrWUgyVVJISktBZVBkQ25q?=
 =?utf-8?B?ZDBXcHJnMWhKUE9NWWplb2o0OG85amhiRzlmZStQaU40amI2NE90emRubVVS?=
 =?utf-8?B?dUw1czdHUnZZaUswcU11b2tZTUxKNSs2NVRYZ3JWUjBKOXpOQXB3djZoQjhx?=
 =?utf-8?B?dkNWWkhqRExvTE5aMWlYZG1hcUpzVWM4K2x4MWpKTHpCOGREbmFFNmRkcWpI?=
 =?utf-8?B?T3ZQbXdMUEZZaE41QlpLcVhKV1YwaVNlbmJvTzlReVVaY1Q5OEc1S3dqN3hY?=
 =?utf-8?B?OVAwQVN2VmF0Z2p0Y0UzVWNxcGhCTEFURnNXc2lBWVY3eTFDTDR4Y3BDOElj?=
 =?utf-8?B?SGl2em1vOU1SWUFic2Q3bEh3bHQrdjhvUjZmTHZNakdoaXF4RWlFcUJzUjUx?=
 =?utf-8?B?b1E0VXJGVDR1SEhMT0RoclY4d0l1R21hQ21UbmVxa1dYd0dCQnNvTUtqcFBB?=
 =?utf-8?B?MWpGRzhTb2ducUhBNy8rVTdmYkR6V3FmMHNJTFBPeWswMUJQblVZRm5BRkND?=
 =?utf-8?B?ZDhmMlpwSlZ5UXhxSFp5bk0rL004VVJ3VEZ4MWw5UGZnZDc5OGdsZERBdUgz?=
 =?utf-8?B?MDI2OVo2ZnluZHIzdThrRlhkMGgwQkF6aG5BTjFuOUE3TE5Sek55eHlEZnpZ?=
 =?utf-8?Q?v8otvyIluBM/dw4YKDF8QsY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c696b97c-9701-47e4-e78b-08dda2526b5a
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2704.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 03:55:03.2598 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fsmwxFrgo/fdRCfcmyhtsz5Wc7nuRVcxLJ4FmGQaBU2WnwWDAo3DNN9ZRwHNf+n5aFPMoAXBrCHvk1c1j7ryvs00X8MtNX3KRJ1qebqcvhSAlJjq2FvZD6ICzzaKAfDf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5101
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

Hi Suraj,

Thanks for the review.

On 29-05-2025 11:31, Kandpal, Suraj wrote:
> 
> 
>> -----Original Message-----
>> From: Reddy Guddati, Santhosh <santhosh.reddy.guddati@intel.com>
>> Sent: Thursday, May 29, 2025 7:25 AM
>> To: igt-dev@lists.freedesktop.org
>> Cc: Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>; Kandpal, Suraj
>> <suraj.kandpal@intel.com>; Thasleem, Mohammed
>> <mohammed.thasleem@intel.com>; Konieczny, Kamil
>> <kamil.konieczny@intel.com>; Reddy Guddati, Santhosh
>> <santhosh.reddy.guddati@intel.com>
>> Subject: [PATCH i-g-t v3 2/2] tests/kms_content_protection: Whitelist check for
>> panel support
>>
>> Verify the connected output is not blacklisted and if the blacklist is found ,
>> skip the test on the output.
>>
>> V2: Rename the function names to reflect the test exemption on panels.
>>
>> V3: Add blocklist array to content_protection and use igt_is_panel_blocked
>> (Suraj)
>>
>> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
>> ---
>>   tests/kms_content_protection.c | 47
>> ++++++++++++++++++++++++++++++++++
>>   1 file changed, 47 insertions(+)
>>
>> diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
>> index 6fe1edbc4..90e2ee79c 100644
>> --- a/tests/kms_content_protection.c
>> +++ b/tests/kms_content_protection.c
>> @@ -36,9 +36,11 @@
>>   #include <sys/stat.h>
>>   #include <libudev.h>
>>   #include "igt.h"
>> +#include "igt_edid.h"
>>   #include "igt_sysfs.h"
>>   #include "igt_kms.h"
>>   #include "igt_kmod.h"
>> +#include "igt_panel.h"
>>
>>   /**
>>    * SUBTEST: lic-type-0
>> @@ -128,6 +130,20 @@ __u8 facsimile_srm[] = {
>>   	0x83, 0xAA, 0xC2, 0x5B, 0x24, 0xB3, 0x36, 0x84, 0x94, 0x75, 0x34,
>> 0xDB,
>>   	0x10, 0x9E, 0x3B, 0x23, 0x13, 0xD8, 0x7A, 0xC2, 0x30, 0x79, 0x84};
>>
>> +/**
>> + * List of Panels that should be excluded from hdcp tests
>> + *
>> + * This array is used to identify and handle scenarios where the test
>> +is
>> + * executed on dummy monitors, such as those found on shard machines.
>> + * Since these dummy monitors are not real and always the test is not
>> +consistent,
>> + * the test is skipped in such cases to avoid false negatives or
>> + * irrelevant test results.
>> + */
>> +static const char *const hdcp_blocklist[] = {
>> +	"DPF90435", /* Example monitor name */
>> +	/* Add more monitor names here as needed */ };
>> +
>>   static void flip_handler(int fd, unsigned int sequence, unsigned int tv_sec,
>>   			 unsigned int tv_usec, void *_data)
>>   {
>> @@ -578,6 +594,32 @@ test_fini(igt_output_t *output, enum
>> igt_commit_style commit_style)
>>   	igt_display_commit2(&data.display, commit_style);  }
>>
>> +static bool is_output_hdcp_test_exempt(igt_output_t *output) {
>> +	drmModePropertyBlobPtr edid_blob = NULL;
>> +	uint64_t edid_blob_id;
>> +	const struct edid *edid;
>> +	char edid_vendor[4];
>> +	char sink_name[20];
>> +
>> +	igt_assert(kmstest_get_property(data.drm_fd,
>> +					output->config.connector-
>>> connector_id,
>> +					DRM_MODE_OBJECT_CONNECTOR,
>> "EDID", NULL,
>> +					&edid_blob_id, NULL));
>> +
>> +	igt_assert(edid_blob = drmModeGetPropertyBlob(data.drm_fd,
>> +edid_blob_id));
>> +
>> +	edid = (const struct edid *)edid_blob->data;
>> +	edid_get_mfg(edid, edid_vendor);
>> +	edid_vendor[3] = '\0';
>> +
>> +	edid_get_monitor_name(edid, sink_name, ARRAY_SIZE(sink_name));
>> +
>> +	drmModeFreePropertyBlob(edid_blob);
>> +
>> +	return igt_is_panel_blocked(sink_name, hdcp_blocklist,
>> +ARRAY_SIZE(hdcp_blocklist)); }
>> +
>>   static void
>>   test_content_protection(enum igt_commit_style commit_style, int
>> content_type)  { @@ -595,6 +637,9 @@ test_content_protection(enum
>> igt_commit_style commit_style, int content_type)
>>   	}
>>
>>   	for_each_connected_output(display, output) {
>> +		igt_require_f(!is_output_hdcp_test_exempt(output),
>> +			      "Skipped as the panel is blacklisted");
>> +
>>   		for_each_pipe(display, pipe) {
>>   			igt_display_reset(display);
>>
>> @@ -923,6 +968,8 @@ static const struct {
>>   	},
>>   };
>>
>> +
>> +
> 
> No need for these extra lines

Will fix this while merging the patch. Thanks>
> With that fixed
> Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
> 
>>   igt_main
>>   {
>>   	igt_fixture {
>> --
>> 2.34.1
> 

