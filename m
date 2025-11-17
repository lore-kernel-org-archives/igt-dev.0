Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27B5CCEACEF
	for <igt-dev@archiver.kernel.org>; Mon, 17 Nov 2025 15:12:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD7AC10E3BE;
	Mon, 17 Nov 2025 15:12:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IFXFgaLc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0E4F10E3BE
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Nov 2025 15:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763392325; x=1794928325;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=8AIFdJg97AGcXaPAx3AjEYhGyXpsHdnpEqGCXaW9jwU=;
 b=IFXFgaLcH/lBYSZsEuoWBjHVkXURHeerjM0Az2Sl9XUEueCh4k0xcv4o
 wfOd8hjslgpCLiuSRycZLb6+y4E2HLvP0h3WNEdKnGtgCtA+d/XMByMmT
 6OL2hoCBxG5d4YBi+k2UCz/zHoxsECg8PCshqzBZrvsFdB6vEzsYIdKmQ
 gLqkK955hTPZqqUaIKpg/bL8Cv+bMVQ2LRd3dhEjS1nJW/2AZD6jhTBZ5
 PsmaS/nmHZXHQ9G/jN3P2RyH0DHadEdWwZ3AqP/mf9HM10Z+lUOqy1u2o
 FEXrm4p0Z3Jb73xEUZPrNuAtX669H0iqfbBL7xwOMUSMynhdLV4rbfwcc w==;
X-CSE-ConnectionGUID: 4hGEG81sTbm2ErXboFFyqQ==
X-CSE-MsgGUID: gn71HTphSaWJfgtrHySnxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="69013902"
X-IronPort-AV: E=Sophos;i="6.19,312,1754982000"; d="scan'208";a="69013902"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 07:11:57 -0800
X-CSE-ConnectionGUID: hKvxPUz2RziMQMnVPL723Q==
X-CSE-MsgGUID: FdSuM3jbQue3fvV76hW50Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,312,1754982000"; d="scan'208";a="190275519"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 07:11:58 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 17 Nov 2025 07:11:56 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 17 Nov 2025 07:11:56 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.16) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 17 Nov 2025 07:11:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ru4lN7JNffol/oGYTc5QulRiWmvdfZTWjdVlva+RuFQuPjt0HmoDxIZQJofIuBlQQeMHYXJcVJBTvri5VogAcgnQcFYF46nmu4XVtp2aWWShRgrjDg/Olx00FKCIfJiQYBo8xvRQPnKBqqj+MNoz/5z8aRIgVTGBpYQ2wvYISaqXnQxec91ZCEV95tK9phlPJMftzuD/6XubgnUbxSjYDaqzlE4qSGBZAKjA2yW6h8yl9wqB6eDO6ozi6xytr6PbhXJGVYIkVTVZKqZpXmSOf4SjskEHt5HWVfWr+oeJUZcrK9A857iqyNPQnzPMUeLMGxuNVfK9uNW6XQMjOADfiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8AIFdJg97AGcXaPAx3AjEYhGyXpsHdnpEqGCXaW9jwU=;
 b=gsA282DAfPyeqMBw4soxCwVKjAwdquAy1iILhQIXYo7ITqQ4Nus9aBnNCpAhmRad6kfBh+X7BpcM7nRMrUbWW15IKpquN0pvxVBMPYal012AO/DWG1hJ/qt+lTR2em+/p4fXHXjUw8WgLti9wKhY+2LOPoibl1LXwerxEYtbAmX069SRUp+GQBNgFtVFMmv6Y0Lxbm8gHwU3VXWfHP/qlyAZkNprC7p2H/lJpX5+pzq3su7gtlhQWyGq0DlXmsEpxP0jsHQc3+7VwHkp03OcW4N05BziAWkF+2VL9bf8MznrXLMaV3L6Pmf0ilZeKfI7ASH6qp7TQSs5KLFdOmu4aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7733.namprd11.prod.outlook.com (2603:10b6:8:dc::19) by
 BL4PR11MB8797.namprd11.prod.outlook.com (2603:10b6:208:5a7::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.22; Mon, 17 Nov 2025 15:11:48 +0000
Received: from DS0PR11MB7733.namprd11.prod.outlook.com
 ([fe80::41a9:1573:32ad:202c]) by DS0PR11MB7733.namprd11.prod.outlook.com
 ([fe80::41a9:1573:32ad:202c%6]) with mapi id 15.20.9320.013; Mon, 17 Nov 2025
 15:11:48 +0000
From: "Hellstrom, Thomas" <thomas.hellstrom@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Sharma, 
 Nishit" <nishit.sharma@intel.com>
Subject: Re: [PATCH i-g-t v7 09/10] tests/intel/xe_multi_gpusvm.c: Add SVM
 multi-GPU conflicting madvise test
Thread-Topic: [PATCH i-g-t v7 09/10] tests/intel/xe_multi_gpusvm.c: Add SVM
 multi-GPU conflicting madvise test
Thread-Index: AQHcVLs8ySgRPljgkUqYGfU4ULbBHrT2/4MA
Date: Mon, 17 Nov 2025 15:11:48 +0000
Message-ID: <f65543bcb03db57ece556008b607db4613a00c59.camel@intel.com>
References: <20251113163308.633818-1-nishit.sharma@intel.com>
 <20251113163308.633818-10-nishit.sharma@intel.com>
In-Reply-To: <20251113163308.633818-10-nishit.sharma@intel.com>
Accept-Language: en-SE, en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.54.3 (3.54.3-2.fc41) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7733:EE_|BL4PR11MB8797:EE_
x-ms-office365-filtering-correlation-id: 48fb7b75-4b45-482e-fc4c-08de25eba0f2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|10070799003|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?dXVZa3Mzb0FraUdhMm1pQ2o4TGsrNnRjMy9tTDl2Z3hJNmQ2eWUxMEloY2dl?=
 =?utf-8?B?R1BmZTFXMGI2WnlNQXBwaUtIYk00WVpFN1FrNktBODRSTjVteHdETDI0ZEVi?=
 =?utf-8?B?V0hhT0RLRndNSElRaWR3ZTJzcjJlMmVnNUVVUnR1U3cvVlN5bExJci9JcmMr?=
 =?utf-8?B?eWJqYVpCOFFrNnhtbTVzaDNnN1ZoN1VQQy9vN3g1eTdZd0pGZWM1TmwvbGN1?=
 =?utf-8?B?QWh1SW1jaGJTM1l0VmVDT01OK1lpbWVSTSs2WjNrbDJDREFSaXRsTXd5dklH?=
 =?utf-8?B?SEtmVjFIeW5OUDNXSXdDdHdZT1NJY0daei8za0tuTnA4UTh3ZEJXdkp0ZkdG?=
 =?utf-8?B?RkR3ZDU2RHBwTXlLaVp0SEFQQVJDam5xTUZuVUl4VWtDNitaOWdzdHBreFZD?=
 =?utf-8?B?RW03SHBLZjRDdGlFYU83cFNxN3BNb0tQQjVLL0pzbzBsZ0UvWkNpNitmQ1JQ?=
 =?utf-8?B?bGlXS0k4ZUtLUk1Rd3ROMUNoUmpFOHc5N1lpVDRDLzZrRWk2bncrZm41bi9s?=
 =?utf-8?B?U0FaU2RhbjZTZE9nYWhVTjFxM3g1T2VESXlOMHpGQ0p4TnJrRU9zM3NqbHFC?=
 =?utf-8?B?ODlZbVR2SFQ0Vm01Zm1SWjJiN21MeEpOdGR6Nk1FOWhUSzIreENKRE5UKzhX?=
 =?utf-8?B?ek5SRkllZk5YbVRYaVhnRjFJSnU3TVpIdVBxM0VybnF4Y0xxWmFqMEtTS3Zn?=
 =?utf-8?B?M1RCSzIwY2tVVm5tdTdqVHZpVmdwU3NzNGVyZVdkVlZ0V2xsSXVqOXozOWp0?=
 =?utf-8?B?RHovV0lLd1kvNnZaa2NHSUFmZzNOMUFCY2RZTFJkZVcwZVpHT01mL3U3U3pm?=
 =?utf-8?B?VUpmaXh0b0FSUVBiY0JPYmRvVWhDNTdTNXdzcCtQRlRDbGJ6MFF1eTJCYmJK?=
 =?utf-8?B?M1JxajZ4Mkc4amRNSTU4L3RyTC94OS80Y05XVWNwazF2SjNBQmVmTTZZUW5r?=
 =?utf-8?B?WjBlcmpNQkswRXMvem4ycGxWM21Pb3BUeUR6QWJXaHFGazg4cUhVT2cwOG5q?=
 =?utf-8?B?OUp6YjMxS2g0MVQ0b0s0V2VSdHpVMHptaFNqQjRiT1B4em4rYXVKWXdsUlVa?=
 =?utf-8?B?WW9WTThJUml5WXVSa3BkR3pQakcrYk1sL3VpNFRhZDRuNVFFR3ZBU0NGbi92?=
 =?utf-8?B?VFJudVNCWXBoUEIyQXI0aURQSHNJNnZUQUY2cHk3U3FnZVBWSXlBeDNQK3ZO?=
 =?utf-8?B?YkRrWE1WK1BTS1FVZTQ2eHo5M3h6ckVvSjdKQ3MrbHh0Q1lzY24rL2tkN1NP?=
 =?utf-8?B?OU8xdllEWktkUmtEcGlGb1I1cUVGM1RlZS9pU2pNVDBMQXU5WW10ZkFjRkNh?=
 =?utf-8?B?R3dCM3czcEpVNGNsS1gwVldDRy9TbkhadU5BeWZmUkl5d0dLRm5tUksydEJ5?=
 =?utf-8?B?YVVyenRPM3BBeHZaeG5oY3hRWU9neVJ0dDhDbmpYVTEvcG1DVm8wZEJ6bGE3?=
 =?utf-8?B?ZVcxa1pkb3Z0TEdQNUV1ejU3VmhHRFVuZS9YMitsYWlXYXhtM0Q2ZlQxWmJk?=
 =?utf-8?B?b3ZmbytSOEFCTlBVSDVoTzVEVExFSWd5T1QwdVd2VlhKTHdMV1JOU0FtbHRt?=
 =?utf-8?B?cXlMTFR4QUgwcW50Y0FzUnYxQ01CRkd5dGlyUzFiNWZXV3BSWDRSRmZPcWVS?=
 =?utf-8?B?cjVsV1pIRktXVUtiU2lrcnhOcExFT2VMWUk5VFFjSTJXQ0t4SFQ2NXZKT1pM?=
 =?utf-8?B?dVZxeXpMbDYxcUppaWREVU9XdlFoSjlSL1JzM3lqMGdmcnpMTHpJNE5WRkxE?=
 =?utf-8?B?MFBBenJzM0c0R0lRSWpuMHIwUDR3b3hMQlUyTEFKcjM0eWtPaTMxbU5BWE1a?=
 =?utf-8?B?SzVKVDFuUTAyaVJLTnc4NjZqdCtlOEVoc0RzeXFoYnBIb3UzbmRsVjNBQ3F1?=
 =?utf-8?B?S2xMK3N6TUxVVmdHWXU1M0tjUzJRQnBYcTc3R2wwbFl3d0tXL3RDREhDQXFl?=
 =?utf-8?B?aEtUOUE1ZkxCb0JvNjFMZHF6NXJ6TGhkTlIvdkNaQ0p1eGUxT25haUl6bXB5?=
 =?utf-8?B?K3M2L01uanh0Yis0R0dOUmlIZ3J3am9RL3hRUkt2NzNlTVJIVDExcXVWWjJN?=
 =?utf-8?Q?2ygZLb?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7733.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(10070799003)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZFZLWnA2N0ZHWEFoZDNYYjltSkQ1cHFlM3BIMFNsMkVpMUhMWGJjZk93MjdU?=
 =?utf-8?B?RlE4SWhrdGRvaTFhTzdrTTZob3kzU3lXNlRBcTQwUnJaRklKeis4eEw5YXRR?=
 =?utf-8?B?WFp1NUhEc1h2dGk2SUh6Und3YnRQTFJHdjh1Mk1NSmZiQk5ZcEc2M3FRSjIx?=
 =?utf-8?B?ajB2Nll1Rlg1bksxRjdoYi9LVEpCQWkrUFRzYldLdXJuc2d3Qk04T002dTVq?=
 =?utf-8?B?UFpHd3dSZkZGUzhMUjFCR0xZUVYxY1RZQzYrcUtyQk9mTnRjUzRSTHRnUWgr?=
 =?utf-8?B?dDRHQklFK3JWZG9FOTNiQlZ0YW9lOE0vQmUrdTNKTU5BMzIrTzM4bGo2OEV4?=
 =?utf-8?B?SllVKzRIb2ZzTVBzSzNvb2RLOHlUYzE5NnpCUFJjN1lnOTk1M2pGMGNqVlRz?=
 =?utf-8?B?QkxxOTZNWVo5Vk1qYUdDWCtZOFRnUzdWclZYWGNjbVJ2K3FGSEk3TWJVM1Z2?=
 =?utf-8?B?N3IvNlJwL2RFcW9mM3p5T3I2V2wzNUdMMUdSaXRlUlZ1eXZ0WjVSa3lDSlRU?=
 =?utf-8?B?S3dybmIxOUFNQVZwaVhXUm5yRzJ1b3kzSnN6am9SbHVaVUZRYlZVWENqUlRH?=
 =?utf-8?B?QUlvT0IxYUw3NGFRVkF0a1UxMEN0cGZPY0VzQ3c2QXVNa2dhZllFN00zN0kx?=
 =?utf-8?B?bkFuOXRJUkEwODBscDl5YjJ5UFU4Sk5sQ0tnc3liSzAyNmN3K1NSc2ViSmE3?=
 =?utf-8?B?dHRScGV1MWMwVzk5STdsajFXNjQyTU1lbklxL2UrUE1zclpNM0tIYXhSYlJK?=
 =?utf-8?B?T0ZpSmdscnBaUXhQWGxmekMrWlpyeXJEdU5EbEh2RUtIcy9IT2RPcDJDbkpY?=
 =?utf-8?B?Q0xaQjN2WEpkME9GRi9UVXFoSkI1SVpvUCtzWHNUcWVoWXk2STRDc1JJS29a?=
 =?utf-8?B?OWdWTHpJR2kyTExjRlJpU1R5b0wvUzdVM09zcmR5NFNSeGhEazB6eGtETTdp?=
 =?utf-8?B?OTJCWk9vOUIyOEZjL2IyWFBEeHJHdlJubWNNWU9FZ1VGbGMzWHJaNGltMFNp?=
 =?utf-8?B?YVAvekxKRk4rTGR3TDRERFgxcEZIcEhYY3dVRUJORWlGcWRBamlHbkt0bnp0?=
 =?utf-8?B?dDZtYjV2aDFlRlFCY2RTNmZ6UXZmSjF1MWtwanJzZWI2Nk5BMXZQK0tsUmNz?=
 =?utf-8?B?QTFicS9kNFRZSEhHbC92QXRWQ3FidzN2eHZNTXg3c085KzlZbGdtem9XNlVS?=
 =?utf-8?B?SFdjWjJnR0V4QU56S3pyUmZjYXdHM292ai9ZSFk1elFNUkMyRTVKMmRBM2N5?=
 =?utf-8?B?azV5QzFFdElPajYybXZMbDdlbXBUc2MvcDZ4WEN1ZWQyRWdNZmNDS01GOVNC?=
 =?utf-8?B?MnE2d3pDaHdoMTFKKzBjNVZVb0JQQ0xGMWFXNjlpeHp0RXhNZjZ6L3ArSHor?=
 =?utf-8?B?RG5MV3hHYjRaR1JVZi9BOGllYmlaaU1rRG4xcUYrVThQV3d5OGc1UkxHcmI1?=
 =?utf-8?B?NkNZU0NGc3NCTHBjendmdHhmeWRvYW5VS3hpS2UwVnVwakREeC9yZVNpTEwx?=
 =?utf-8?B?TXRIdmVQTkxVbVpQRmpXQkhiQUhrNmI2SGwrRjJJaEFDdVZnd2EwVEFkRUdh?=
 =?utf-8?B?K3lHdy9CbXh4MzlnME5YK2JKTHBNT2Z1NnBnV2xGTmtsLzJhY2FqdnFpUUJG?=
 =?utf-8?B?eldTTGxKaTVBejNQRktEd2RLcmVlTG9zU211MTRLdXMyUThrYVkwTVV5clky?=
 =?utf-8?B?WGhodUtCdTFTV2NxYzcyZmE1UnRDVDdJbFpiQ2pXNlIxRTdqdDA3YzZ1NnRz?=
 =?utf-8?B?RVJDMEp1cTFiOEU0bDhMdzE1RjhFVjV3N3dkVkRGa20yb01McmxaUGR4RFZE?=
 =?utf-8?B?bWJOM3hEU01kd3RiMzZSOUNCMUpLaFd3cU5hQlZTbHJlbStMMGd2eWpOKzE5?=
 =?utf-8?B?K3dsbDZNd0JQVWI0ZEEwTzdZbDlFQjNheVZabWUzVURBU3hJY25lc0NGQ3Ay?=
 =?utf-8?B?Z2ZDV01JSkVNSm5zUDNIbjZtdjJUbUROQm5ZNTRwZUJJVTZ0QnNmWWU1TTRC?=
 =?utf-8?B?SWpieHRFYlB6akRUNTBHQWdSclVFMmduU3dkMUpTU0pBZlYwUUg1eVRGSU1L?=
 =?utf-8?B?bWpRYnE4OWRuVnRzeW1WMng5U1pPdklGSVU0cGNCVWdDMXEvS2Vsa3VTZnF4?=
 =?utf-8?B?cFBMVmw2dXZSamVsdW9Od1BjcmE3djA3bkFEaFBLNkJiKzVDcjdYSWFSclJT?=
 =?utf-8?Q?crmNbbeUrhIgc29rTOhDtvMnm3E59clOIlurSWKyYL0F?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <962ED77678A86C41AE915674D55FB492@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7733.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48fb7b75-4b45-482e-fc4c-08de25eba0f2
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2025 15:11:48.0359 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Zf3l+fBXCmDEufACFjN2Ogh/OKlynvzIqXcEl11KkfNgCAk0tjFbJYD4xMDfZbCae9DoJUa1dqn0rvtcNHDxIFXdpk1Rom2DASoyKiQZSVw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR11MB8797
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

T24gVGh1LCAyMDI1LTExLTEzIGF0IDE2OjMzICswMDAwLCBuaXNoaXQuc2hhcm1hQGludGVsLmNv
bSB3cm90ZToNCj4gRnJvbTogTmlzaGl0IFNoYXJtYSA8bmlzaGl0LnNoYXJtYUBpbnRlbC5jb20+
DQo+IA0KPiBUaGlzIHRlc3QgY2FsbHMgbWFkdmlzZSBvcGVyYXRpb25zIG9uIEdQVTAgd2l0aCB0
aGUgcHJlZmVycmVkDQo+IGxvY2F0aW9uIHNldA0KPiB0byBHUFUxIGFuZCB2aWNlIHZlcnNhLiBJ
dCByZXBvcnRzIGNvbmZsaWN0cyB3aGVuIGNvbmZsaWN0aW5nIG1lbW9yeQ0KPiBhZHZpY2UNCj4g
aXMgZ2l2ZW4gZm9yIHNoYXJlZCBTVk0gYnVmZmVycyBpbiBhIG11bHRpLUdQVSBlbnZpcm9ubWVu
dC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IE5pc2hpdCBTaGFybWEgPG5pc2hpdC5zaGFybWFAaW50
ZWwuY29tPg0KPiAtLS0NCj4gwqB0ZXN0cy9pbnRlbC94ZV9tdWx0aV9ncHVzdm0uYyB8IDE0Mw0K
PiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+IMKgMSBmaWxlIGNoYW5nZWQs
IDE0MyBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvdGVzdHMvaW50ZWwveGVfbXVs
dGlfZ3B1c3ZtLmMNCj4gYi90ZXN0cy9pbnRlbC94ZV9tdWx0aV9ncHVzdm0uYw0KPiBpbmRleCBk
YzJhOGY5YzguLmFmYmYwMTBlNiAxMDA2NDQNCj4gLS0tIGEvdGVzdHMvaW50ZWwveGVfbXVsdGlf
Z3B1c3ZtLmMNCj4gKysrIGIvdGVzdHMvaW50ZWwveGVfbXVsdGlfZ3B1c3ZtLmMNCj4gQEAgLTU5
LDYgKzU5LDExIEBADQo+IMKgICogRGVzY3JpcHRpb246DQo+IMKgICrCoAlUaGlzIHRlc3RzIGF1
bmNoZXMgc2ltdWx0YW5lb3VzIHdvcmtsb2FkcyBvbiBib3RoIEdQVXMNCj4gYWNjZXNzaW5nIHRo
ZQ0KPiDCoCAqwqAJc2FtZSBTVk0gYnVmZmVyIHN5bmNocm9uaXplcyB3aXRoIGZlbmNlcywgYW5k
IHZlcmlmaWVzIGRhdGENCj4gaW50ZWdyaXR5DQo+ICsgKg0KPiArICogU1VCVEVTVDogY29uZmxp
Y3RpbmctbWFkdmlzZS1ncHUNCj4gKyAqIERlc2NyaXB0aW9uOg0KPiArICrCoAlUaGlzIHRlc3Qg
Y2hlY2tzIGNvbmZsaWN0aW5nIG1hZHZpc2UgYnkgYWxsb2NhdGluZyBzaGFyZWQNCj4gYnVmZmVy
DQo+ICsgKsKgCXByZWZldGNoZXMgZnJvbSBib3RoIGFuZCBjaGVja3MgZm9yIG1pZ3JhdGlvbiBj
b25mbGljdHMNCj4gwqAgKi8NCj4gwqANCj4gwqAjZGVmaW5lIE1BWF9YRV9SRUdJT05TCTgNCj4g
QEAgLTY5LDYgKzc0LDggQEANCj4gwqAjZGVmaW5lIEVYRUNfU1lOQ19WQUwgMHg2NzY3NjcNCj4g
wqAjZGVmaW5lIENPUFlfU0laRSBTWl82NE0NCj4gwqAjZGVmaW5lCUFUT01JQ19PUF9WQUwJNTYN
Cj4gKyNkZWZpbmUgVVNFUl9GRU5DRV9WQUxVRcKgwqDCoMKgwqDCoMKgIDB4ZGVhZGJlZWZkZWFk
YmVlZnVsbA0KPiArI2RlZmluZSBGSVZFX1NFQ8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCAoNUxMICogTlNFQ19QRVJfU0VDKQ0KPiDCoA0KPiDCoHN0cnVjdCB4ZV9zdm1fZ3B1X2luZm8g
ew0KPiDCoAlib29sIHN1cHBvcnRzX2ZhdWx0czsNCj4gQEAgLTEzNiw2ICsxNDMsMTEgQEAgc3Rh
dGljIHZvaWQgZ3B1X3NpbXVsdF90ZXN0X3dyYXBwZXIoc3RydWN0DQo+IHhlX3N2bV9ncHVfaW5m
byAqc3JjLA0KPiDCoAkJCQnCoMKgwqAgc3RydWN0DQo+IGRybV94ZV9lbmdpbmVfY2xhc3NfaW5z
dGFuY2UgKmVjaSwNCj4gwqAJCQkJwqDCoMKgIHZvaWQgKmV4dHJhX2FyZ3MpOw0KPiDCoA0KPiAr
c3RhdGljIHZvaWQgZ3B1X2NvbmZsaWN0X3Rlc3Rfd3JhcHBlcihzdHJ1Y3QgeGVfc3ZtX2dwdV9p
bmZvICpzcmMsDQo+ICsJCQkJwqDCoMKgwqDCoCBzdHJ1Y3QgeGVfc3ZtX2dwdV9pbmZvICpkc3Qs
DQo+ICsJCQkJwqDCoMKgwqDCoCBzdHJ1Y3QNCj4gZHJtX3hlX2VuZ2luZV9jbGFzc19pbnN0YW5j
ZSAqZWNpLA0KPiArCQkJCcKgwqDCoMKgwqAgdm9pZCAqZXh0cmFfYXJncyk7DQo+ICsNCj4gwqBz
dGF0aWMgdm9pZA0KPiDCoGNyZWF0ZV92bV9hbmRfcXVldWUoc3RydWN0IHhlX3N2bV9ncHVfaW5m
byAqZ3B1LCBzdHJ1Y3QNCj4gZHJtX3hlX2VuZ2luZV9jbGFzc19pbnN0YW5jZSAqZWNpLA0KPiDC
oAkJwqDCoMKgIHVpbnQzMl90ICp2bSwgdWludDMyX3QgKmV4ZWNfcXVldWUpDQo+IEBAIC03OTgs
NiArODEwLDExNiBAQCBwYWdlZmF1bHRfdGVzdF9tdWx0aWdwdShzdHJ1Y3QgeGVfc3ZtX2dwdV9p
bmZvDQo+ICpncHUwLA0KPiDCoAljbGVhbnVwX3ZtX2FuZF9xdWV1ZShncHUxLCB2bVsxXSwgZXhl
Y19xdWV1ZVsxXSk7DQo+IMKgfQ0KPiDCoA0KPiArI2RlZmluZQlYRV9CT19GTEFHX1NZU1RFTQlC
SVQoMSkNCj4gKyNkZWZpbmUgWEVfQk9fRkxBR19DUFVfQUREUl9NSVJST1LCoMKgwqDCoMKgIEJJ
VCgyNCkNCj4gKw0KPiArc3RhdGljIHZvaWQNCj4gK2NvbmZsaWN0aW5nX21hZHZpc2Uoc3RydWN0
IHhlX3N2bV9ncHVfaW5mbyAqZ3B1MCwNCj4gKwkJwqDCoMKgIHN0cnVjdCB4ZV9zdm1fZ3B1X2lu
Zm8gKmdwdTEsDQo+ICsJCcKgwqDCoCBzdHJ1Y3QgZHJtX3hlX2VuZ2luZV9jbGFzc19pbnN0YW5j
ZSAqZWNpLA0KPiArCQnCoMKgwqAgYm9vbCBub19wcmVmZXRjaCkNCj4gK3sNCj4gKwl1aW50NjRf
dCBhZGRyOw0KPiArCXVpbnQzMl90IHZtWzJdOw0KPiArCXVpbnQzMl90IGV4ZWNfcXVldWVbMl07
DQo+ICsJdWludDMyX3QgYmF0Y2hfYm9bMl07DQo+ICsJdm9pZCAqZGF0YTsNCj4gKwl1aW50NjRf
dCBiYXRjaF9hZGRyWzJdOw0KPiArCXN0cnVjdCBkcm1feGVfc3luYyBzeW5jWzJdID0ge307DQo+
ICsJdm9sYXRpbGUgdWludDY0X3QgKnN5bmNfYWRkclsyXTsNCj4gKwlpbnQgbG9jYWxfZmQ7DQo+
ICsJdWludDE2X3QgbG9jYWxfdnJhbTsNCj4gKw0KPiArCWNyZWF0ZV92bV9hbmRfcXVldWUoZ3B1
MCwgZWNpLCAmdm1bMF0sICZleGVjX3F1ZXVlWzBdKTsNCj4gKwljcmVhdGVfdm1fYW5kX3F1ZXVl
KGdwdTEsIGVjaSwgJnZtWzFdLCAmZXhlY19xdWV1ZVsxXSk7DQo+ICsNCj4gKwlkYXRhID0gYWxp
Z25lZF9hbGxvYyhTWl8yTSwgU1pfNEspOw0KPiArCWlndF9hc3NlcnQoZGF0YSk7DQo+ICsJYWRk
ciA9IHRvX3VzZXJfcG9pbnRlcihkYXRhKTsNCj4gKw0KPiArCXhlX3ZtX21hZHZpc2UoZ3B1MC0+
ZmQsIHZtWzBdLCBhZGRyLCBTWl80SywgMCwNCj4gKwkJwqDCoMKgwqDCoCBEUk1fWEVfTUVNX1JB
TkdFX0FUVFJfUFJFRkVSUkVEX0xPQywNCj4gKwkJwqDCoMKgwqDCoCBEUk1fWEVfUFJFRkVSUkVE
X0xPQ19ERUZBVUxUX1NZU1RFTSwgMCwgMCk7DQo+ICsNCj4gKwlzdG9yZV9kd29yZF9iYXRjaF9p
bml0KGdwdTAtPmZkLCB2bVswXSwgYWRkciwgJmJhdGNoX2JvWzBdLA0KPiAmYmF0Y2hfYWRkclsw
XSwgMTApOw0KPiArCXN0b3JlX2R3b3JkX2JhdGNoX2luaXQoZ3B1MS0+ZmQsIHZtWzBdLCBhZGRy
LCAmYmF0Y2hfYm9bMV0sDQo+ICZiYXRjaF9hZGRyWzFdLCAyMCk7DQo+ICsNCj4gKwkvKiBQbGFj
ZSBkZXN0aW5hdGlvbiBpbiBhbiBvcHRpb25hbGx5IHJlbW90ZSBsb2NhdGlvbiB0bw0KPiB0ZXN0
ICovDQo+ICsJbG9jYWxfZmQgPSBncHUwLT5mZDsNCj4gKwlsb2NhbF92cmFtID0gZ3B1MC0+dnJh
bV9yZWdpb25zWzBdOw0KPiArCXhlX211bHRpZ3B1X21hZHZpc2UoZ3B1MC0+ZmQsIHZtWzBdLCBh
ZGRyLCBTWl80SywNCj4gKwkJCcKgwqDCoCAwLCBEUk1fWEVfTUVNX1JBTkdFX0FUVFJfUFJFRkVS
UkVEX0xPQywNCj4gKwkJCcKgwqDCoCBncHUxLT5mZCwgMCwgZ3B1MS0+dnJhbV9yZWdpb25zWzBd
LA0KPiBleGVjX3F1ZXVlWzBdLA0KPiArCQkJwqDCoMKgIGxvY2FsX2ZkLCBsb2NhbF92cmFtKTsN
Cj4gKw0KPiArCWxvY2FsX2ZkID0gZ3B1MS0+ZmQ7DQo+ICsJbG9jYWxfdnJhbSA9IGdwdTEtPnZy
YW1fcmVnaW9uc1swXTsNCj4gKwl4ZV9tdWx0aWdwdV9tYWR2aXNlKGdwdTEtPmZkLCB2bVsxXSwg
YWRkciwgU1pfNEssDQo+ICsJCQnCoMKgwqAgMCwgRFJNX1hFX01FTV9SQU5HRV9BVFRSX1BSRUZF
UlJFRF9MT0MsDQo+ICsJCQnCoMKgwqAgZ3B1MC0+ZmQsIDAsIGdwdTAtPnZyYW1fcmVnaW9uc1sw
XSwNCj4gZXhlY19xdWV1ZVswXSwNCj4gKwkJCcKgwqDCoCBsb2NhbF9mZCwgbG9jYWxfdnJhbSk7
DQo+ICsNCj4gKwlzZXR1cF9zeW5jKCZzeW5jWzBdLCAmc3luY19hZGRyWzBdLCBCSU5EX1NZTkNf
VkFMKTsNCj4gKwlzZXR1cF9zeW5jKCZzeW5jWzFdLCAmc3luY19hZGRyWzFdLCBCSU5EX1NZTkNf
VkFMKTsNCj4gKw0KPiArCS8qIEZvciBzaW11bHRhbmVvdXMgYWNjZXNzIG5lZWQgdG8gY2FsbCB4
ZV93YWl0X3VmZW5jZSBmb3INCj4gYm90aCBncHVzIGFmdGVyIHByZWZldGNoICovDQo+ICsJaWYo
IW5vX3ByZWZldGNoKSB7DQoNCkFnYWluLCBzdWdnZXN0IGZsYWcgcGFyYW1ldGVyIGFuZCBzZXBh
cmF0ZSB0ZXN0cy4NCg0KPiArCQl4ZV92bV9wcmVmZXRjaF9hc3luYyhncHUwLT5mZCwgdm1bMF0s
IDAsIDAsIGFkZHIsDQo+ICsJCQkJwqDCoMKgwqAgU1pfNEssICZzeW5jWzBdLCAxLA0KPiArCQkJ
CcKgwqDCoMKgDQo+IERSTV9YRV9DT05TVUxUX01FTV9BRFZJU0VfUFJFRl9MT0MpOw0KPiArDQo+
ICsJCXhlX3ZtX3ByZWZldGNoX2FzeW5jKGdwdTEtPmZkLCB2bVsxXSwgMCwgMCwgYWRkciwNCj4g
KwkJCQnCoMKgwqDCoCBTWl80SywgJnN5bmNbMV0sIDEsDQo+ICsJCQkJwqDCoMKgwqANCj4gRFJN
X1hFX0NPTlNVTFRfTUVNX0FEVklTRV9QUkVGX0xPQyk7DQo+ICsNCj4gKwkJaWYgKCpzeW5jX2Fk
ZHJbMF0gIT0gQklORF9TWU5DX1ZBTCkNCj4gKwkJCXhlX3dhaXRfdWZlbmNlKGdwdTAtPmZkLCAo
dWludDY0X3QNCj4gKilzeW5jX2FkZHJbMF0sIEJJTkRfU1lOQ19WQUwsIGV4ZWNfcXVldWVbMF0s
DQo+ICsJCQkJwqDCoMKgwqDCoMKgIE5TRUNfUEVSX1NFQyAqIDEwKTsNCj4gKwkJZnJlZSgodm9p
ZCAqKXN5bmNfYWRkclswXSk7DQo+ICsJCWlmICgqc3luY19hZGRyWzFdICE9IEJJTkRfU1lOQ19W
QUwpDQo+ICsJCQl4ZV93YWl0X3VmZW5jZShncHUxLT5mZCwgKHVpbnQ2NF90DQo+ICopc3luY19h
ZGRyWzFdLCBCSU5EX1NZTkNfVkFMLCBleGVjX3F1ZXVlWzFdLA0KPiArCQkJCcKgwqDCoMKgwqDC
oCBOU0VDX1BFUl9TRUMgKiAxMCk7DQo+ICsJCWZyZWUoKHZvaWQgKilzeW5jX2FkZHJbMV0pOw0K
PiArCX0NCj4gKw0KPiArCWlmIChub19wcmVmZXRjaCkgew0KPiArCQlmcmVlKCh2b2lkICopc3lu
Y19hZGRyWzBdKTsNCj4gKwkJZnJlZSgodm9pZCAqKXN5bmNfYWRkclsxXSk7DQo+ICsJfQ0KPiAr
DQo+ICsJZm9yIChpbnQgaSA9IDA7IGkgPCAxOyBpKyspIHsNCg0KVGhpcyBsb29wIG9ubHkgcnVu
cyBvbmNlIHdpdGggaSA9PSAwID8NCg0KVGhhbmtzLA0KVGhvbWFzDQoNCg0KDQoNCj4gKwkJc3lu
Y19hZGRyWzBdID0gKHZvaWQgKikoKGNoYXIgKiliYXRjaF9hZGRyWzBdICsNCj4gU1pfNEspOw0K
PiArCQlzeW5jWzBdLmFkZHIgPSB0b191c2VyX3BvaW50ZXIoKHVpbnQ2NF90DQo+ICopc3luY19h
ZGRyWzBdKTsNCj4gKwkJc3luY1swXS50aW1lbGluZV92YWx1ZSA9IEVYRUNfU1lOQ19WQUw7DQo+
ICsNCj4gKwkJc3luY19hZGRyWzFdID0gKHZvaWQgKikoKGNoYXIgKiliYXRjaF9hZGRyWzFdICsN
Cj4gU1pfNEspOw0KPiArCQlzeW5jWzFdLmFkZHIgPSB0b191c2VyX3BvaW50ZXIoKHVpbnQ2NF90
DQo+ICopc3luY19hZGRyWzFdKTsNCj4gKwkJc3luY1sxXS50aW1lbGluZV92YWx1ZSA9IEVYRUNf
U1lOQ19WQUw7DQo+ICsJCSpzeW5jX2FkZHJbMF0gPSAwOw0KPiArCQkqc3luY19hZGRyWzFdID0g
MDsNCj4gKw0KPiArCQl4ZV9leGVjX3N5bmMoZ3B1MC0+ZmQsIGV4ZWNfcXVldWVbMF0sIGJhdGNo
X2FkZHJbMF0sDQo+ICZzeW5jWzBdLCAxKTsNCj4gKwkJaWYgKCpzeW5jX2FkZHJbMF0gIT0gRVhF
Q19TWU5DX1ZBTCkNCj4gKwkJCXhlX3dhaXRfdWZlbmNlKGdwdTAtPmZkLCAodWludDY0X3QNCj4g
KilzeW5jX2FkZHJbMF0sIEVYRUNfU1lOQ19WQUwsIGV4ZWNfcXVldWVbMF0sDQo+ICsJCQkJwqDC
oMKgwqDCoMKgIE5TRUNfUEVSX1NFQyAqIDEwKTsNCj4gKwkJeGVfZXhlY19zeW5jKGdwdTEtPmZk
LCBleGVjX3F1ZXVlWzFdLCBiYXRjaF9hZGRyWzFdLA0KPiAmc3luY1sxXSwgMSk7DQo+ICsJCWlm
ICgqc3luY19hZGRyWzFdICE9IEVYRUNfU1lOQ19WQUwpDQo+ICsJCQl4ZV93YWl0X3VmZW5jZShn
cHUxLT5mZCwgKHVpbnQ2NF90DQo+ICopc3luY19hZGRyWzFdLCBFWEVDX1NZTkNfVkFMLCBleGVj
X3F1ZXVlWzFdLA0KPiArCQkJCcKgwqDCoMKgwqDCoCBOU0VDX1BFUl9TRUMgKiAxMCk7DQo+ICsJ
fQ0KPiArDQo+ICsJaWd0X2Fzc2VydF9lcSgqKHVpbnQ2NF90ICopYWRkciwgMjApOw0KPiArDQo+
ICsJbXVubWFwKCh2b2lkICopYmF0Y2hfYWRkclswXSwgQkFUQ0hfU0laRShncHUwLT5mZCkpOw0K
PiArCW11bm1hcCgodm9pZCAqKWJhdGNoX2FkZHJbMV0sIEJBVENIX1NJWkUoZ3B1MC0+ZmQpKTsN
Cj4gKwliYXRjaF9maW5pKGdwdTAtPmZkLCB2bVswXSwgYmF0Y2hfYm9bMF0sIGJhdGNoX2FkZHJb
MF0pOw0KPiArCWJhdGNoX2ZpbmkoZ3B1MS0+ZmQsIHZtWzFdLCBiYXRjaF9ib1sxXSwgYmF0Y2hf
YWRkclsxXSk7DQo+ICsJZnJlZShkYXRhKTsNCj4gKw0KPiArCWNsZWFudXBfdm1fYW5kX3F1ZXVl
KGdwdTAsIHZtWzBdLCBleGVjX3F1ZXVlWzBdKTsNCj4gKwljbGVhbnVwX3ZtX2FuZF9xdWV1ZShn
cHUxLCB2bVsxXSwgZXhlY19xdWV1ZVsxXSk7DQo+ICt9DQo+ICsNCj4gwqBzdGF0aWMgdm9pZA0K
PiDCoGF0b21pY19pbmNfb3Aoc3RydWN0IHhlX3N2bV9ncHVfaW5mbyAqZ3B1MCwNCj4gwqAJwqDC
oMKgwqDCoCBzdHJ1Y3QgeGVfc3ZtX2dwdV9pbmZvICpncHUxLA0KPiBAQCAtMTAxMiw2ICsxMTM0
LDE5IEBAIG11bHRpZ3B1X2FjY2Vzc190ZXN0KHN0cnVjdCB4ZV9zdm1fZ3B1X2luZm8NCj4gKmdw
dTAsDQo+IMKgCWNsZWFudXBfdm1fYW5kX3F1ZXVlKGdwdTEsIHZtWzFdLCBleGVjX3F1ZXVlWzFd
KTsNCj4gwqB9DQo+IMKgDQo+ICtzdGF0aWMgdm9pZA0KPiArZ3B1X2NvbmZsaWN0X3Rlc3Rfd3Jh
cHBlcihzdHJ1Y3QgeGVfc3ZtX2dwdV9pbmZvICpzcmMsDQo+ICsJCQnCoCBzdHJ1Y3QgeGVfc3Zt
X2dwdV9pbmZvICpkc3QsDQo+ICsJCQnCoCBzdHJ1Y3QgZHJtX3hlX2VuZ2luZV9jbGFzc19pbnN0
YW5jZSAqZWNpLA0KPiArCQkJwqAgdm9pZCAqZXh0cmFfYXJncykNCj4gK3sNCj4gKwlzdHJ1Y3Qg
bXVsdGlncHVfb3BzX2FyZ3MgKmFyZ3MgPSAoc3RydWN0IG11bHRpZ3B1X29wc19hcmdzDQo+ICop
ZXh0cmFfYXJnczsNCj4gKwlpZ3RfYXNzZXJ0KHNyYyk7DQo+ICsJaWd0X2Fzc2VydChkc3QpOw0K
PiArDQo+ICvCoMKgwqDCoMKgwqDCoCBjb25mbGljdGluZ19tYWR2aXNlKHNyYywgZHN0LCBlY2ks
IGFyZ3MtPnByZWZldGNoX3JlcSk7DQo+ICt9DQo+ICsNCj4gwqBzdGF0aWMgdm9pZA0KPiDCoGdw
dV9sYXRlbmN5X3Rlc3Rfd3JhcHBlcihzdHJ1Y3QgeGVfc3ZtX2dwdV9pbmZvICpzcmMsDQo+IMKg
CQkJIHN0cnVjdCB4ZV9zdm1fZ3B1X2luZm8gKmRzdCwNCj4gQEAgLTExMDgsNiArMTI0MywxNCBA
QCBpZ3RfbWFpbg0KPiDCoAkJZm9yX2VhY2hfZ3B1X3BhaXIoZ3B1X2NudCwgZ3B1cywgJmVjaSwN
Cj4gZ3B1X2NvaGVyZWN5X3Rlc3Rfd3JhcHBlciwgJmNvaF9hcmdzKTsNCj4gwqAJfQ0KPiDCoA0K
PiArCWlndF9zdWJ0ZXN0KCJjb25mbGljdGluZy1tYWR2aXNlLWdwdSIpIHsNCj4gKwkJc3RydWN0
IG11bHRpZ3B1X29wc19hcmdzIGNvbmZsaWN0X2FyZ3M7DQo+ICsJCWNvbmZsaWN0X2FyZ3MucHJl
ZmV0Y2hfcmVxID0gMTsNCj4gKwkJZm9yX2VhY2hfZ3B1X3BhaXIoZ3B1X2NudCwgZ3B1cywgJmVj
aSwNCj4gZ3B1X2NvbmZsaWN0X3Rlc3Rfd3JhcHBlciwgJmNvbmZsaWN0X2FyZ3MpOw0KPiArCQlj
b25mbGljdF9hcmdzLnByZWZldGNoX3JlcSA9IDA7DQo+ICsJCWZvcl9lYWNoX2dwdV9wYWlyKGdw
dV9jbnQsIGdwdXMsICZlY2ksDQo+IGdwdV9jb25mbGljdF90ZXN0X3dyYXBwZXIsICZjb25mbGlj
dF9hcmdzKTsNCj4gKwl9DQo+ICsNCj4gwqAJaWd0X3N1YnRlc3QoImxhdGVuY3ktbXVsdGktZ3B1
Iikgew0KPiDCoAkJc3RydWN0IG11bHRpZ3B1X29wc19hcmdzIGxhdGVuY3lfYXJnczsNCj4gwqAJ
CWxhdGVuY3lfYXJncy5wcmVmZXRjaF9yZXEgPSAxOw0KDQo=
