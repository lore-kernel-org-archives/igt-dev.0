Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECA9AC5474A
	for <igt-dev@archiver.kernel.org>; Wed, 28 Aug 2024 08:01:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 981D510E4C8;
	Wed, 28 Aug 2024 08:01:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BxiqhuFG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AB7510E09F
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Aug 2024 12:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724762918; x=1756298918;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=nt2nBV5m3WINPpiod4ubXHoNU+IA1O8vrIZZj7POm6E=;
 b=BxiqhuFG54eO8Jflua+HomO8s/bmAipJTARqTpdUw8ZhiZNRzCANmhmI
 jkVzeUuEwtBwOoNNO+xNCgyhJctGXyjoFHQ0qK7Zu9sYa+gAUtnebng3k
 Rg3xJFRB5zdUbe7EhCXzDfUr8OQa22/D6zHVdEIdnM52P0RGYtu0BBICd
 zcauf/38SdHFg4NGYAJi+nzSQSdQt19zlF7GktFREAc/GMhOlvmCOUq+R
 aGB5x/SUZh42DXctOkxfaxIVlLoKTUzt7NAo4c+USAVUUcLWQulcVJ5+x
 F5+NgOwKBhAlcbolqny5W38hMPh/k7lw3JbKJO9Ig2m2oYZAo1Kzb8f5e Q==;
X-CSE-ConnectionGUID: ucpZChr7TQOj/dp3C3pLCw==
X-CSE-MsgGUID: vmnW5qUZQai93dGBw6UdwQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="45753088"
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; d="scan'208";a="45753088"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 05:48:38 -0700
X-CSE-ConnectionGUID: B3UnHWDSSRmhquuov2FPdQ==
X-CSE-MsgGUID: gxJPFPPtSZSQYoIxM1SU2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; d="scan'208";a="67717106"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Aug 2024 05:48:39 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 27 Aug 2024 05:48:37 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 27 Aug 2024 05:48:37 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 27 Aug 2024 05:48:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EBpy/XFDyxxBh49xwau/a5XEqP8AobAzk930IydOwz45aZIVuWiF/v/++g/sb+6hZ8LJNp+BrbRA1IJM7rcKZ2Zp0n0xf9+gHdjtiBCni+z75B599wInNOwr3iGl0uhfdgWVDwXFl2GYa3rQNbw2KNykgCysfAu0e27A79ng1cVqmtSnowTZbmuolZ+oXTx73zjRUhgAaY9yw6Rk2kjrcyzm2FxfvcMi7XrKvp2btzKLAkDey6lqPfw82dxzfoY8vYVl9s2c5lqqTPahEf/+SA73czjv3UjN7dl/xxvHTUkhc1+I759Vf1oqkHi20EBD1IHcvX6MTtJ4RThbjPPhSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8V473SnjCx0q3mVKQPa9eLbkQh2eUS/X62fqAGxWjSM=;
 b=FREiR5nWHzVh/6d4w3eFyhg9VjuB5kKCCVOhgldCszj1Bnu305HBzAp97VyDmSufY7lGfPk7WBBPWjPVB6GdYUz7XDEMqa40kfnmieAV9etTiplugqJnVPM4QKamZu0BQRhKrNmtV9C0gSORnkEWSAFI7UhETgLblVG4JrNHZ8dyJK2JFys2lc7fFH3ExSWFNvPFAcdQ+czRaUqPfERSQisAGkdabVnSvzG06GtovRqV4HLAnhZ5igSIlHqYW9E6rGk24/7I1SaIv1wQvGEVyhOu5LCwW2swT4eOgwwYscqahs0U5gCaMN8lWim1/jjl8ZqMCsvv/Ws1TR5TynfV0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by PH0PR11MB5191.namprd11.prod.outlook.com (2603:10b6:510:3e::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.25; Tue, 27 Aug
 2024 12:48:35 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%4]) with mapi id 15.20.7897.021; Tue, 27 Aug 2024
 12:48:34 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CY5PR11MB62119DD080EF001546D7D41C95942@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20240822092058.26784-1-sujaritha.sundaresan@intel.com>
 <20240822165243.kfcmvdlxsxh6p4mv@kamilkon-DESK.igk.intel.com>
 <172434871596.2055.1015145340873010177@gjsousa-mobl2>
 <4e6gyyd3qf7bfyrtwbun4w42clu55v7r5glgrfikstw5hs5xyn@wdfocxn3uqsg>
 <172468301865.6014.9946879676247551400@gjsousa-mobl2>
 <82a8af36-642a-4747-b085-924c02e6308e@intel.com>
 <CY5PR11MB62119DD080EF001546D7D41C95942@CY5PR11MB6211.namprd11.prod.outlook.com>
Subject: RE: [PATCH i-g-t,
 v4] tests/intel/xe_pm: Add tests for suspend without display
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: Kamil Konieczny <kamil.konieczny@linux.intel.com>, "igt-dev@"
 <lists.freedesktop.org igt-dev@lists.freedesktop.org>, "Piecielska,
 Katarzyna" <katarzyna.piecielska@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>, "Gupta, Anshuman"
 <anshuman.gupta@intel.com>, "Sundaresan, Sujaritha"
 <sujaritha.sundaresan@intel.com>
Date: Tue, 27 Aug 2024 09:48:28 -0300
Message-ID: <172476290898.3066.9682588878616653824@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: MW4PR03CA0117.namprd03.prod.outlook.com
 (2603:10b6:303:b7::32) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|PH0PR11MB5191:EE_
X-MS-Office365-Filtering-Correlation-Id: 0de5ec71-6016-4e43-a3bb-08dcc6969023
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RzVTWWtNdG1Pb3RQMjlWUVRqNjZTUHhzd3lQT2J1Um4yakZmMkNpb2gyQTNM?=
 =?utf-8?B?aVZyTGFmdFh1UWJSUW9obHVkWjhoVW9DaCs4dHFnV2dhU0Ryb0pFQ1ZJZkZ1?=
 =?utf-8?B?aVBxd0RPMHBFNjdMWGQ4TTNXUm44NjFpOUQvVVBPTm5ITlhZNmRPV2ZnMVRx?=
 =?utf-8?B?SnpOUFEza2QzRy9VNlBsTkFvcDFGSitNSWhWS0V3MlFtNnVVQWdnb1I4NFJz?=
 =?utf-8?B?YWtWMXFsOUo2bFRFSlhwV3NnQUU2ZndzMkRYYk83Q3VnbHB0TUMwRzYxK05N?=
 =?utf-8?B?UG5kQUlwZnVobC9rb01oVnAxcVp2TnROa1VxZnhPcXBQTjM5cW1NbUhuYUEx?=
 =?utf-8?B?eEdJYkN6dzVDRTRWL0lJaEg3TnhnUDlSSUVBaVhlbzRyZit0N1Exb2pHWXV2?=
 =?utf-8?B?RThjbEdTL0I5Vit1V0FVRDkvSTQ3a09RMVBVYjc0ZnVTNVo1cjVpajRIRWZJ?=
 =?utf-8?B?L0E4V1UxaFVHNUhEMG5SL3JIYThoQkQwOTh2MkpxcUV0dWZWTGIyVGQyUGhS?=
 =?utf-8?B?eXpyanNYa1lzSCs0Nm9uQS81RzBFankyRURMR3NaT2NWYUt4NElwejhkMnpD?=
 =?utf-8?B?c3JiUDZ4S2s2ZTV6aGhQemdvNGRTZWY2OExqTmIrM0VKaFhTYmZlSUxjakxK?=
 =?utf-8?B?Q1Z0aTJSaEE4WFA1c1VpSDgzWVVkaVhXbjNLNHZ6Y21Ua0xCQ2ZxVmdaS2Qx?=
 =?utf-8?B?Y0tSc2Z0dXRoYllqMDh2ZDRqbUVIclZnb1pkbWtld29UWVZRTkh3bE9wdUhJ?=
 =?utf-8?B?ajJpdzV6VXUvbzQzTFhIL3NDZ0JpMjNNN0V1djJXU3NReGh0REZyYzFXZ3RW?=
 =?utf-8?B?SENBNWFxMVd5bFpUazFUWjJkVWNSOXcxY0JkVjF1TDNERmFwbURWQnN5dVNv?=
 =?utf-8?B?SXlGSndvT0EwNElpemxaSGNtZXVKWmU5Vys5T0EwL093UWNIVWlWTnJ0VzVP?=
 =?utf-8?B?L1RmUUZTaDlnNWNvaHNqeEdMRUhuZnZsWXJ1bTFpRDNkY2hKL1BBMmF1czJk?=
 =?utf-8?B?ZzBiL3hhRnlGUG80a1pxVEp2Vm5VM2ZhbTNrR0NraSs0dnBYMnpLRXBYeUNo?=
 =?utf-8?B?TzA4Ny90TkJBVUVvRWtlQS8xUjRqYjdhd3FlMGJNYzNHbGpxcTlKV1dNUG1C?=
 =?utf-8?B?dTY3bGw3a1BxZlVqNGNGOFllbUh0bGtZdnpDbGZOZFU1RmhIdkxZN3Z1eEgy?=
 =?utf-8?B?UHhSRTRqaTRpemx5aWM4RkQzSHlpWXZBT1Z5c0dLWXB6Z1lCMzMyc0t5WnpX?=
 =?utf-8?B?Uk9MNjFmMjZGdVhtSm5qTWM1ZE8zL0diTUc5Um9JZnEvbnc3L0VBTHFaQSt4?=
 =?utf-8?B?WGEvMnJpQk15cUhobXRlNHM2YjUwUzA2d0J4WE8rN3VabUtWaENjYjZMalNG?=
 =?utf-8?B?dDU5RTlScDU4ejhlcW5ydFg3SHlYYjJXVWRMSHdxMEtveVU4OTBrZjVvL0VY?=
 =?utf-8?B?MjdXY0MwbGMxR29wcThMWlAwMWhUWWNXdStvTUkwMmJ4SmhkVDVTb1AwVFBv?=
 =?utf-8?B?UDVRaWFNNEhJZmZQN1NZZFB0UnMwbWNROEQvVWh6OXd6ZWRtNk5DbWl2ckM2?=
 =?utf-8?B?SFpzU3ZYaWltM0hEK3hTRmNsZDdDT0daeVdmWFhtOHk1UW1HK3VOc3h2MFZV?=
 =?utf-8?B?WC91M1dFU1RkM3UybVBla0RLOG9jcmtyMWxZYjNNUjRHYTA4aXdIamFULzVs?=
 =?utf-8?B?bTBmWUZxd25zblVldkNSZTRtcmtXdHpubEtpU3UzNTFZei9ra0ZqUmlYZFJD?=
 =?utf-8?B?NW1aaE9xTzVqYWV2amJPc2ZEUXV6NDcxVzJmM0NVckxDMGhpcjAxb2hiK0hv?=
 =?utf-8?B?YTdPdFpwQi9kd3JaQTlLQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cVg5RWVHY084YXBFU084dzZKaUU4ZWcvTkx6V0pSTXV3ZGNKYnBPRXI1Mml1?=
 =?utf-8?B?amJpQ0kvVlVScVFVTkI1VHptWHZCU1dpallTeGs4QTZCL0JSR21SdERVeGpZ?=
 =?utf-8?B?M2tUR1NidkFNK0tGYUg4QzExZVh5OHFSYWM2eitIcWJjT3RvSzB1VFBQZ2tO?=
 =?utf-8?B?MXBFZ0FjakZCeDBUWWNvTGZYdndQV1NpUEVoc2R4ckVnNW5CV3puQ3JQc0Fo?=
 =?utf-8?B?NzBFcVpBdWNuaHZ4bkJZNnpoUDhkeGdzbjBsaUtnaTJCeHB2bFNYWUo3NEFo?=
 =?utf-8?B?dGdnODQyQythT0JnUmQrS0FBR1gxbFNMbjZWbWkzblBRSkZjNU8yNVJUMU1i?=
 =?utf-8?B?RjR3M0xFYjgvUnFra1NEUGFlZzFmcXgxazJ1S2RrakFpNmlRNVpWQmxnMDdZ?=
 =?utf-8?B?VFVkekMxcjNxUkZUZkdoZk44QXdDUjM2Vms0M2FtV3dTZE90WTBrckdDTmVi?=
 =?utf-8?B?TG5JMlZwNktJL2l3dWFNY2hEbU02WjRFSU1ZRlpjaEcrRm9pbzRTc25Jcys0?=
 =?utf-8?B?THFnSnZxYVNidW5lanVXMml0elc3Ry95dzVaa3pKUnEvTTY4OXZ5dm1OUWFi?=
 =?utf-8?B?QjlxOU93UlA4VUJKU1N0VEN5bHk2WFcxdXc3amNqV1dBOWRQd2RTaHlCQUg5?=
 =?utf-8?B?WXZ4dlRjZkUycm81Z0Y4aVZIWWZoclZEaVFoaVprZDBlYUVKRERic3pzQmNm?=
 =?utf-8?B?L0JnN3hhRTJiQXVJa2tXaGxpZWpoTXlTSk5KNmIxcjNSdzU5ZFJ6UmtmU29u?=
 =?utf-8?B?cUhLdzRPajBkaGszbXpzeHA5QndzR2t1czhGVWVCSjJ5c096YzVMcnJFaGRu?=
 =?utf-8?B?bDRUVDdNZ0dyOFlFVU5ZZDhnOEUzc0RYODg1OTh1bTh3Q0VxaUpoTEFOOFVj?=
 =?utf-8?B?VktuRFduWnozQ2tqU283ZW5wRWJ5c0NKRWN0L3dJZGZPaXl6UEVMM2RoR1Ur?=
 =?utf-8?B?MERJby9jV0dTQjExTmt5Y1JSMmN1YWFRU1RDN0V0bVBCWDAraDZSdW82Zy9G?=
 =?utf-8?B?dFpXTzAvSmViTUVlakJMVkpUbGllOXVxWk9Dd1ZXU0tPYlVBTHJhV1M1Znlz?=
 =?utf-8?B?dktFUkxneTJrM1gzTlZ5cUF0OWkzU1Q0V2lYM0RjTFBaU0FVK0pnWG4vTm1W?=
 =?utf-8?B?QjJXOENpcFRORHFkaTlTSnc1cXRqV1FXVFFTYVNDRnBmSmFwNjlWNjc3V3Ru?=
 =?utf-8?B?aElyWlpTeU11c2NxS25xSkdaQ0lMckl6b3hlQ1hTaFBkNnNhalZXQkVRTk9D?=
 =?utf-8?B?ZG5DZVZicU0yVEdwZGlHNGFxdlh6TVI0dWowZFMxdzJCTTExVmVEbGVGbVRQ?=
 =?utf-8?B?OWE1TnlrL0FkV2VlYi9nOFdZc2hHZnlHdTQrbUJaRzFMM2lpZEZmSWcrc3hN?=
 =?utf-8?B?cE1jNnQ2RThXbzFaQjdwbzg1aWFsZ3hrOG9BYWZ2YW43cit4VEkvN3M4Umty?=
 =?utf-8?B?emVkZGJmMlU0bEdNT0ZEcCtyVjNib0hYM1E1eFFtNGtQdVFnTDIwUjVUekN3?=
 =?utf-8?B?UjF5NC82K2xoQi9sbjMrR0l2RURMNllsVDBEcE5XMFYvQW54K1FqWHVFb1BR?=
 =?utf-8?B?c0pXSDkwb05iNkdvTTFOby94Z0tWbTdrRmxrenVqdEJId2p2R3FCdjZHWGU1?=
 =?utf-8?B?QWlCMWJoTjVxMjIvMk9HZ3dSbFJWY01jTks4RnBqT3FGR0ltbDVIYVVzTHZI?=
 =?utf-8?B?MUVnTmZ4L3BuMXUva3BoQVFBNWFpOHB1aE53K2lKTVhaSngyd1QzYnMzVS9z?=
 =?utf-8?B?Uk41cHNNUGMrb0tvQ0dTeC9HazZqYnhyT0NoYlFlVU9RSGZUazlUbi9NcGNV?=
 =?utf-8?B?WnZRTGJYT2NTSHJsL2NGNHcvRm9EK2hrNGtpSCtneithU0tVRk1USEttV3hq?=
 =?utf-8?B?bHVEWElFQ2FPZVJNYU9oV0x2MS9oQVVnMmZFa3Q3elkxelJEM09JSXhXeDhQ?=
 =?utf-8?B?a0J4bjFKTncxZWpwTTVOaTM3dTFURlBjVnR6UXFIK0MwTXdUZ1pNWFlHa2NI?=
 =?utf-8?B?SFpOSE9zUDZaYVlXdlJhaGs0RmdvU2sxeVF2d3R6aWk0bHlYV3JDTDArUXli?=
 =?utf-8?B?dDVrVW53Z09KRStXM0k0cWkyU3pDdUMreWdsaU1rNCtDcFNtVHBuUVE5cXpy?=
 =?utf-8?B?d3QzVFFjNFkwMXB2bUErbWdUd2JycFF6NmhSWEZBK2Q4a2pYdmsxYkhlakJY?=
 =?utf-8?B?OGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0de5ec71-6016-4e43-a3bb-08dcc6969023
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2024 12:48:34.6953 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2GudrSvb411UMbe2fWS86y2U3ktUYK9nXOkVgf7i4epO4fEO+tP32z/QRRycp/2X4j3vN7lwzwK8udzxdS9V/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5191
X-OriginatorOrg: intel.com
X-Mailman-Approved-At: Wed, 28 Aug 2024 08:01:28 +0000
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

Quoting Gupta, Anshuman (2024-08-27 06:29:06-03:00)

>For s0ix DC9 is the pre-requisite rather then DC6, DC9 does not have any d=
epende
>ncy on DMC.

Maybe DC6 and DC9 are pre-requisites for different S0ix sub-states?

- BSpec 68851 says that DC6 is requirement for S0ix.
- BSpec 68857 says that DC9 supports S0ix with more power savings than
  DC6.

--
Gustavo Sousa
