Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51FFCC52D7C
	for <igt-dev@archiver.kernel.org>; Thu, 15 Aug 2024 14:01:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7BA510E407;
	Thu, 15 Aug 2024 14:01:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UdgjvXhB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7062610E402
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Aug 2024 14:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723730474; x=1755266474;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=f6/rpRFvg/H8+oVjTVgRT0V77qdT8ihtzeU0VMkW2fU=;
 b=UdgjvXhBHaiKwIxoDnzceBg6Q081ky9vbN/qZgCNJvZ+cyyT4Ok2SnQU
 XdobnVRtfiyANdTihlTeUW3s1CooIsF8NXh0NfIUXbd4j7wU4LoX3WZZR
 dKVuCP36/O0aBejprPB/oQNRjDIOXV7Y025AW8GQDOxVGxuMAiZFgo1Pt
 tRCsgdAPGEFZJuAa0DhKyKrjVKxc6g81DDMN0MpPYOFeh6FWaUYwJYyLB
 jJi/fXkaJa+Xs8v1URpx8BPb3AeglaN5c4ZIFleZcQpXOZTeBz7swfeq9
 oNapc0wotBCAgG8qIJq2Od9qMJIsi0bUkYCOzveJjZt9juhkqGUXJXqlD w==;
X-CSE-ConnectionGUID: Rm+OVTh2QpCp5VsVwq9Cbw==
X-CSE-MsgGUID: 8rvvDldaSqatLY8z2bjPjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11165"; a="25849904"
X-IronPort-AV: E=Sophos;i="6.10,149,1719903600"; d="scan'208";a="25849904"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2024 07:01:13 -0700
X-CSE-ConnectionGUID: 6bkVhwiHQ1uAJhe3E2/u2g==
X-CSE-MsgGUID: WJAVBbs/SyessjdgxPIfzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,149,1719903600"; d="scan'208";a="59632403"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Aug 2024 07:01:11 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 15 Aug 2024 07:01:11 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 15 Aug 2024 07:01:11 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 15 Aug 2024 07:01:11 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 15 Aug 2024 07:01:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w3nUiwzwBFqc+uehacPMGOYjqppX/XHkUB/0mu/KaP6HDsxJI9CvAjrVpdygJKeZS27Ut1WYwH56rsTYtNFovSnLFo21PzYX4RWDIrF3PA5rpa39a1TWb9yr18cO8s1SGq/5/vF1eqVVT4DBto4fhP5NK2ssf6Z0MoMAtKA2iafr3hCovHy184tpwpn4JEzDFHj5dyAFFLF/37vQ7+ne6ZCorjJ9goFygKon53A/l0KEB8RUc7P4ikoNKc6/TM0KXgfnLs6ixF7lQ6ns33T08ghkuAHqkVECxwrrb+bUE49k0QxA47rda9BKQ7r7M8B71DWzcNDJSiM/6BgFPdOqWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f6/rpRFvg/H8+oVjTVgRT0V77qdT8ihtzeU0VMkW2fU=;
 b=n1zs/5pRdgf7zYUxAVZrj2f2gHWo9Q4nDVHkasJoTWDBR7ZrSTH8HyG6BdXJY1h7+eLQ1qrARApL11QOrqvsieuGAQnDYwE+XnNWS6o2p6j5xv3uHBeePjHLCbcQdr6LBxMrF2XMFGIzd+xvLxPhv2stXSQmuq0/iAmfFbcvjsteM+AckiM9LkQtTIN12RwZ/tVTytbEiOzQOB5hn/6JdqGmYu9Lv4bpQHzHuX5SnQO61mh3b+uF2kaw5bXRcZCzywBV8q8ok2HS78BeRf2pBL+iTNnYm6iyLm33bX9V5+fPhb2SoffCd2PkInBNAUW7VJW2VjTe59EMSHv3iRcbGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.18; Thu, 15 Aug
 2024 14:01:03 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%6]) with mapi id 15.20.7875.016; Thu, 15 Aug 2024
 14:01:02 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: Nirmoy Das <nirmoy.das@linux.intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Gupta, saurabhg" <saurabhg.gupta@intel.com>, "Zuo, Alex"
 <alex.zuo@intel.com>, "Harrison, John C" <john.c.harrison@intel.com>, "Das,
 Nirmoy" <nirmoy.das@intel.com>, "chris.p.wilson@linux.intel.com"
 <chris.p.wilson@linux.intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH i-g-t] tests/intel/gem_spin_batch: RCS/CCS must share VM
 on DG2 due to w/a
Thread-Topic: [PATCH i-g-t] tests/intel/gem_spin_batch: RCS/CCS must share VM
 on DG2 due to w/a
Thread-Index: AQHa7nsVLnpyzxiNEU690s6hknYOBrIn8lkAgABndwA=
Date: Thu, 15 Aug 2024 14:01:02 +0000
Message-ID: <CH0PR11MB54442DF4E663E64AAC7178B2E5802@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20240814183336.507650-1-jonathan.cavitt@intel.com>
 <b2c10808-8a92-4adf-93c0-b6699fde481d@linux.intel.com>
In-Reply-To: <b2c10808-8a92-4adf-93c0-b6699fde481d@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|DM4PR11MB7757:EE_
x-ms-office365-filtering-correlation-id: bcd304a8-cfc7-4cfb-1e49-08dcbd32b300
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?TVZuSit2MS9IUjQ3bjZjeGVtYUQvZDgyUkNxcnBwUzUyS09lcm5KL2ZVbklr?=
 =?utf-8?B?VlZGbEhUemVBR2ZGTzJrUDF3VXVyOXQxcCsrMHcxTjlPeHozNDFqaWRkV0pP?=
 =?utf-8?B?YjBrbFpuV3RrcWlUT05QOHJCVkFLaklNMHJVWTg0SCtkRG5tMFY2MVNOSnVP?=
 =?utf-8?B?MTJkYks5V1BsRGJIS0hOQ1FSeEF5T1NyNzUzRmRmd084TTZsb2xEM015VGpp?=
 =?utf-8?B?V1NMSy9CZElUYkpTT05FOXR6akllRTdHb0I1OWprTndRcVJsQ3NJemh4bEpP?=
 =?utf-8?B?ZHNjaVZlZzJZamlXYzQzaWRuRGdvSWN4azlxd1dodlRxMldIWHA3c3JKanow?=
 =?utf-8?B?eVllUk5TZHhHSE4zMVN3VEVqNitzVTZjeFF4aW5MY0EwWGQxR3J4YXVDc25C?=
 =?utf-8?B?QXpqMEN6bHppdDNZblBUT0NyVUZ2RGZoZURKM0FJYWNaMityR01KbHlHcWlZ?=
 =?utf-8?B?R3UyekxNTjZmMGVyaVJhYkdoS1RYMlJ3Sm1aSGo1VlhXdG9KUFZFZVV1M3N5?=
 =?utf-8?B?RUpvSzJsa2xnYUpiWUtWZ1JhU1BnZTZGK2VyTUl2TTBmZXVZRHd4T3N1R0ZX?=
 =?utf-8?B?RndhZkZSNkwyakFWVU9ZZTRwQzY3bHlyZ3h6bnJCSm5rYlRHdFBqRzRYSDJC?=
 =?utf-8?B?Nkt1dXVnVFJScDJXZ3lWMjVTb1FtV1NtMVdoS0xHR1JrZFRqZ2UzQmtEMjJm?=
 =?utf-8?B?akdWdmJrYklZSE1FNE5uU3dYUlcvVzlNZGY0czJUaVZ3V1czL3I0R3lZdE9K?=
 =?utf-8?B?OFpyQ204OW95Yll5MVZ2cDIzckZ2cG1aWWRMeTVHMUJmVFNRYW9hSDQ0MjNB?=
 =?utf-8?B?TktVN0Z0bWdvMk1DTk1YV2V3TUs0SjVBYlBNSXZOZGFYVVFqQlpEeEFzaUpu?=
 =?utf-8?B?OG1wUnkzN2pxdHVrOFV1TUtZSjkxbzF3QTRmYWUzTnNldmp3cDZ2WmxFMHgz?=
 =?utf-8?B?YytYaTVIUGhqY1Q0ck4rQnhpNWZDVHhaRTMvdjBXejRkdjZ5ejMrYzNpUnVU?=
 =?utf-8?B?TkNWQ2xrbXUwdkdXNWtPSVdmR3ZwSGRmanhQb3ZjaVdSMnc4NE8waDJCb1E0?=
 =?utf-8?B?emExd2hrM2lmdk9tUVlhbFhFQkpDd0VBZTgzSXI2VFUzNklIcTlsZ3ptQlB5?=
 =?utf-8?B?QjhmOXZ3Ui9ROGFBZmVlUHNBS3Y0THd5Y0FadkJCbGJzQWdSZDI0WjBFZEow?=
 =?utf-8?B?UzBGaE5QTXA2QTZNb0JUZkNCSyt4QXFhejNWTDZ2UFh4OXk1Mm9KekhMaGdj?=
 =?utf-8?B?b1c5MmUvSnNiZXNSc2NjYlRLQ2huaXNsSWFibnN1Z21BRllnK2FEcnRsb3Zh?=
 =?utf-8?B?SE1YazYxNWkxSU1LTGtXSGltY1lWcmZXbmdoYXNraUVGM0IrL2lxMkl0TjQx?=
 =?utf-8?B?L2pOakM5QlJvK3NmZ1doUGNJUGZyZThyNnRTdmt1ck41alNPZGZrWHZqQnFY?=
 =?utf-8?B?NFFrKzFKYStGZFRSb1NOTlNpQW91NnZOVnlIRTFCalFOdlY3S0xrKzN5WVVG?=
 =?utf-8?B?S1ZpcWdCQ3JBZURLaXdyZzdsOG9UR0FYU2hFYjZqUk1TZGtiL1BvektxaDdr?=
 =?utf-8?B?elF6aTJRSWdYeE9Ta0RIWERObXQrRm4zaTg3WkMzeWhGZ2VMZlAvdktobUph?=
 =?utf-8?B?NzBtN2VvOTVpTEFCeUx4Q2hkbU5IQ1ppRzUwYXpOQ3kzVTlzS2FiZ3k3UlVz?=
 =?utf-8?B?Z2hiNE5sSmFZcXg3NmhKT2o5N3pwcy9GQStXYitvcWprQjJPQmVOOTJ2N0l5?=
 =?utf-8?B?eUwyem1FOUlGT0F5WUhINk5VLzl2R0MvRnlCOHJVSzF4aVFzUFZ5YjVyTEpx?=
 =?utf-8?B?WnlidUw0WDFvUzdYUVg2bUZVSE9BbUlHSjRWTmhWMmpXeXJmK2UrcWlWVmFB?=
 =?utf-8?B?ZjNMZjgweFZlQTFIbFErMjNYc2JaWi9mQ0JIU3hCWnBxQnc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Y2U5TUU5VnNGeDk2ZGJZc3hRMGhSQ2gxZFdhUnIxM05sREljaVNsb1JMZktr?=
 =?utf-8?B?b0sxcmtNb0NJTmlwbzY2bFZ4aktnYlhuMkt5ckFMbTE3ZXVRcjdHNlhmdmNs?=
 =?utf-8?B?RFN6dkpmQ1RidGgyazR1Y09GVWxGK0NLVy9XRE44OU0xQnR1TWFGMEZFbzF2?=
 =?utf-8?B?UXRCYmpzci9oZEkrTWtqL3NMR3c2dHo2d2l3UWdpeHVKZ01kSWhWQTd0OC8v?=
 =?utf-8?B?ZHY5Vy9wbXJqVWNWMmJ5OTZEWHdrOEptU2k0QklMd0IzREdEWThqWUgvbGFu?=
 =?utf-8?B?ejgwMkI1Y3FseVcreEprRkxCRG1WNkNmVU11MkxMc1V0aDltVFIvZmdiUkJj?=
 =?utf-8?B?bmkwS2JuQmFvRTdkTTVqUktIaGtZR1l1WGFKeWpDS1EyMnQrQVltZVE0WHZr?=
 =?utf-8?B?UXIra0ZWSENFMlBhRVVLZzV2aEFLNjZDenpUemJMdjR4c0Z2eDlQazRvWkdq?=
 =?utf-8?B?NEJ1ajQwVnE1MzBRbWh1QTZKeDhQZWREeXNVLzNhSExHTG84bDk5clBKS0xX?=
 =?utf-8?B?U2N0ajA1TnJKZ3JLNEtXK3lyVVhrbTNUOVVVVlkyRzlDUkpOV2pMMXg5YmdJ?=
 =?utf-8?B?aGFPUUM1Vkp0dlJuQVlkWWNvYUVZYlZVWFBmRTB4NzlMQUVoaTF5c3U2RFdq?=
 =?utf-8?B?cGE3Ym9CTlE5TzRUVVBMaWNGbFByTXNqWVh3b3JiaVZmMmhVV09yS3FlMTJH?=
 =?utf-8?B?TEtCYVNIZlF6Tll0MkdGaDRyREVLR0NuTDVkUHJyWEg2LzI4NllqNnVUQld1?=
 =?utf-8?B?L0x2WDVYeFpCWDhPTUg4OU5lcm9qVFRqMXQzVTVaQXE5czJTaDNQc0hRVXdj?=
 =?utf-8?B?Zk5lTU9UTER2WUNpV0ptNXpuVkpBOWkzYlJLSkwrMzNMSHdCbkxhU2Vqd1A3?=
 =?utf-8?B?TFJFTGxwLzViZHZMYkcrMEhLZlFObERwc25GN2RXMEd6Q2RDZzkwSmk0Mlcr?=
 =?utf-8?B?Nm5pQ21abThHVVdkb1NiQVdvcjdqejJNRk8xdWk3U0dmOGNJdkl4TFNFY3pi?=
 =?utf-8?B?Zkg3aXRnZEtnWVYwUC84dDR2QzlrTVZuTUZlcHlXVnEzc1VUbjAzTVYzOUln?=
 =?utf-8?B?QkdBWWZ4ZWpza0xGelFabXBJaVh4WUdBREUrWi9tZEp4Vk1qendyNXBvK0Y2?=
 =?utf-8?B?ZThpVWhOK044STRaSS9SUEg5ZGFvaUVSd2lRaEloNzJWdit4emxSUERza2dE?=
 =?utf-8?B?ZDdEbEsrc2xtKzBqZWtucDNxRXQ3SHhvZlNwQVdaa1lyNXYzM1QvRmRwb21G?=
 =?utf-8?B?c3l2aGlkWWNOMjB3ejYwY0k3cjVPcHNiR243OGNuMFQ2dVoyV2VsVkpXTkQ5?=
 =?utf-8?B?djdwKzRwZjNsS2NrQ3NpWEs4bndlbC9ZUjBlZ2xzaEpFZ0o3djlHbmJBZitk?=
 =?utf-8?B?TFI0dnBudTVKNXdjNjRpaGx3azhudEpQcWliRGVaVWRaand0TnlPaVBsemJ2?=
 =?utf-8?B?blZPbmlmZVByMTc0NzVpbDVKRG9EanZ4VFI1dDVRVW9MczByeE5PMXMzNGFB?=
 =?utf-8?B?MGZZeG9JUC9JM1dITU12WlF3RExkTjZpbURLa1BjSzFNOThyZkJNRmdkaUkw?=
 =?utf-8?B?TGNOZ0I5Q1EyYjZTSFp3L0dkeGJvWW91WCtEKy9tK2xNbkk5VDNJVHo1anly?=
 =?utf-8?B?Z0NxNy8vVFcwdFhjeTJ4UXhoVHEvWEM3OUswbGJlMG9HZFRDWXl0ajI0RmNH?=
 =?utf-8?B?L2hOZjczbU5ocVU5clBOQkNuWTJRRWROaUxaQzR0anQ4WmhKK25rSHZQdWls?=
 =?utf-8?B?VkhJNExTL0xPVFhQdHdJd0xjUllQdmxSTDNYVWU5Z1RPcmgwOEtLU3RWYXB5?=
 =?utf-8?B?Q0E4aFdPTDZIbGtIVElrc1dMbStBcS9INS93cUd1ZHl5YTd2a0RKTmVaZWJR?=
 =?utf-8?B?emM0R2FKUHRUTjZTbVY1enQ5NVMvZHBmUnJTWUZXQXlQcWFRV0RVRHc0bFA0?=
 =?utf-8?B?YXoxVllEai9RNU9vNjZMT1hzckQ4Q25aRGE5cDMwVkpRdll3bWFiMGl2OE15?=
 =?utf-8?B?TXltM1F3aVpRRG5aKytCTXNZRFQ1eXdQZVdreml5Tmc2VmN4NVF3UzR2c0lr?=
 =?utf-8?B?TW1DOU9iZmFyN0wwRXVmbXAwN05oRFZXWENoai8zdC90SmtCRjZEamJvc3Jo?=
 =?utf-8?Q?I9lhTfxH5057k+IPe9gnomC0U?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bcd304a8-cfc7-4cfb-1e49-08dcbd32b300
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2024 14:01:02.8386 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JASuQuO8YIo25tnd5qXQTglm33MXjWP8RjdJH3tEiqe901rLI0qqsCRml/iq3NTwYS4U/OF2yFEe+VxTrUcNZOTgmYr7tO6i+Lr/r7xG5xI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7757
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

LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IE5pcm1veSBEYXMgPG5pcm1veS5kYXNA
bGludXguaW50ZWwuY29tPiANClNlbnQ6IFRodXJzZGF5LCBBdWd1c3QgMTUsIDIwMjQgMTI6NDkg
QU0NClRvOiBDYXZpdHQsIEpvbmF0aGFuIDxqb25hdGhhbi5jYXZpdHRAaW50ZWwuY29tPjsgaWd0
LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCkNjOiBHdXB0YSwgc2F1cmFiaGcgPHNhdXJhYmhn
Lmd1cHRhQGludGVsLmNvbT47IFp1bywgQWxleCA8YWxleC56dW9AaW50ZWwuY29tPjsgSGFycmlz
b24sIEpvaG4gQyA8am9obi5jLmhhcnJpc29uQGludGVsLmNvbT47IERhcywgTmlybW95IDxuaXJt
b3kuZGFzQGludGVsLmNvbT47IGNocmlzLnAud2lsc29uQGxpbnV4LmludGVsLmNvbQ0KU3ViamVj
dDogUmU6IFtQQVRDSCBpLWctdF0gdGVzdHMvaW50ZWwvZ2VtX3NwaW5fYmF0Y2g6IFJDUy9DQ1Mg
bXVzdCBzaGFyZSBWTSBvbiBERzIgZHVlIHRvIHcvYQ0KPiANCj4gDQo+IE9uIDgvMTQvMjAyNCA4
OjMzIFBNLCBKb25hdGhhbiBDYXZpdHQgd3JvdGU6DQo+ID4gT24gREcyLCBib3RoIHRoZSBSQ1Mg
YW5kIENDUyBlbmdpbmUgY29udGV4dHMgbXVzdCB1c2UgdGhlIHNhbWUgdmlydHVhbA0KPiA+IGFk
ZHJlc3Mgc3BhY2Ugd2hlbiBydW5uaW5nIHBhcmFsbGVsLCBub24tcHJlZW1wdGlibGUgd29yay4g
IEZhaWx1cmUgdG8NCj4gPiBkbyBzbyByZXN1bHRzIGluIGEgR1BVIGhhbmcuDQo+ID4NCj4gPiBT
dWdnZXN0ZWQtYnk6IEpvaG4gSGFycmlzb24gPGpvaG4uYy5oYXJyaXNvbkBpbnRlbC5jb20+DQo+
ID4gU2lnbmVkLW9mZi1ieTogSm9uYXRoYW4gQ2F2aXR0IDxqb25hdGhhbi5jYXZpdHRAaW50ZWwu
Y29tPg0KPiA+IENDOiBOaXJtb3kgRGFzIDxuaXJtb3kuZGFzQGludGVsLmNvbT4NCj4gPiBDQzog
Q2hyaXMgV2lsc29uIDxjaHJpcy5wLndpbHNvbkBsaW51eC5pbnRlbC5jb20+DQo+ID4gLS0tDQo+
ID4gICB0ZXN0cy9pbnRlbC9nZW1fc3Bpbl9iYXRjaC5jIHwgMjAgKysrKysrKysrKysrKysrKysr
Ky0NCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCAxOSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0p
DQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvdGVzdHMvaW50ZWwvZ2VtX3NwaW5fYmF0Y2guYyBiL3Rl
c3RzL2ludGVsL2dlbV9zcGluX2JhdGNoLmMNCj4gPiBpbmRleCA2ODJhMDYyMTgwLi4xOWIxM2Y3
MzM0IDEwMDY0NA0KPiA+IC0tLSBhL3Rlc3RzL2ludGVsL2dlbV9zcGluX2JhdGNoLmMNCj4gPiAr
KysgYi90ZXN0cy9pbnRlbC9nZW1fc3Bpbl9iYXRjaC5jDQo+ID4gQEAgLTI0LDYgKzI0LDcgQEAN
Cj4gPiAgIA0KPiA+ICAgI2luY2x1ZGUgImk5MTUvZ2VtLmgiDQo+ID4gICAjaW5jbHVkZSAiaTkx
NS9nZW1fcmluZy5oIg0KPiA+ICsjaW5jbHVkZSAiaTkxNS9nZW1fdm0uaCINCj4gPiAgICNpbmNs
dWRlICJpZ3QuaCINCj4gPiAgIC8qKg0KPiA+ICAgICogVEVTVDogZ2VtIHNwaW4gYmF0Y2gNCj4g
PiBAQCAtMTc5LDkgKzE4MCwyMCBAQCBzdGF0aWMgdm9pZCBzcGluX2FsbChpbnQgaTkxNSwgY29u
c3QgaW50ZWxfY3R4X3QgKmN0eCwgdW5zaWduZWQgaW50IGZsYWdzKQ0KPiA+ICAgCWNvbnN0IHN0
cnVjdCBpbnRlbF9leGVjdXRpb25fZW5naW5lMiAqZTsNCj4gPiAgIAlpbnRlbF9jdHhfY2ZnX3Qg
Y2ZnID0gY3R4LT5jZmc7DQo+ID4gICAJc3RydWN0IGlndF9zcGluICpzcGluLCAqbjsNCj4gPiAr
CXVpbnQzMl90IHNoYXJlZF92bV9pZCA9IDA7DQo+ID4gICAJdWludDY0X3QgYWhuZDsNCj4gPiAg
IAlJR1RfTElTVF9IRUFEKGxpc3QpOw0KPiA+ICAgDQo+ID4gKwkvKg0KPiA+ICsJICogV2FfMTQw
MTQ0OTQ1NDc6REcyDQo+IA0KPiBIU0QgdGFsa3MgYWJvdXQgREcyIGFuZCBNVEwsIGlzIHRoaXMg
c29tZWhvdyBmaXhlZCBpbiBNVEwgPw0KDQpTZWUgdGhlIGZ1bmN0aW9uIHNraXBfYmFkX2VuZ2lu
ZQ0KDQotSm9uYXRoYW4gQ2F2aXR0DQoNCj4gDQo+IA0KPiBOaXJtb3kNCj4gDQo+ID4gKwkgKiBC
b3RoIHRoZSBSQ1MgYW5kIENDUyBlbmdpbmUgY29udGV4dHMgbXVzdCB1c2UgdGhlIHNhbWUNCj4g
PiArCSAqIHZpcnR1YWwgYWRkcmVzcyBzcGFjZSB3aGVuIHJ1bm5pbmcgcGFyYWxsZWwsDQo+ID4g
KwkgKiBub24tcHJlZW1wdGlibGUgd29yay4gIEZhaWx1cmUgdG8gZG8gc28gcmVzdWx0cyBpbiBh
DQo+ID4gKwkgKiBHUFUgaGFuZy4NCj4gPiArCSAqLw0KPiA+ICsJaWYgKElTX0RHMihpbnRlbF9n
ZXRfZHJtX2RldmlkKGk5MTUpKSkNCj4gPiArCQlzaGFyZWRfdm1faWQgPSBnZW1fdm1fY3JlYXRl
KGk5MTUpOw0KPiA+ICsNCj4gPiAgIAlmb3JfZWFjaF9jdHhfY2ZnX2VuZ2luZShpOTE1LCAmY2Zn
LCBlKSB7DQo+ID4gICAJCWlmICghZ2VtX2NsYXNzX2Nhbl9zdG9yZV9kd29yZChpOTE1LCBlLT5j
bGFzcykpDQo+ID4gICAJCQljb250aW51ZTsNCj4gPiBAQCAtMTkyLDggKzIwNCwxMSBAQCBzdGF0
aWMgdm9pZCBzcGluX2FsbChpbnQgaTkxNSwgY29uc3QgaW50ZWxfY3R4X3QgKmN0eCwgdW5zaWdu
ZWQgaW50IGZsYWdzKQ0KPiA+ICAgCQlpZiAoc2tpcF9iYWRfZW5naW5lKGk5MTUsIGUpKQ0KPiA+
ICAgCQkJY29udGludWU7DQo+ID4gICANCj4gPiAtCQlpZiAoZmxhZ3MgJiBQQVJBTExFTF9TUElO
X05FV19DVFgpDQo+ID4gKwkJaWYgKGZsYWdzICYgUEFSQUxMRUxfU1BJTl9ORVdfQ1RYKSB7DQo+
ID4gKwkJCWlmIChzaGFyZWRfdm1faWQpDQo+ID4gKwkJCQljZmcudm0gPSBzaGFyZWRfdm1faWQ7
DQo+ID4gICAJCQljdHggPSBpbnRlbF9jdHhfY3JlYXRlKGk5MTUsICZjZmcpOw0KPiA+ICsJCX0N
Cj4gPiAgIAkJYWhuZCA9IGdldF9yZWxvY19haG5kKGk5MTUsIGN0eC0+aWQpOw0KPiA+ICAgDQo+
ID4gICAJCS8qIFByZXZlbnQgcHJlZW1wdGlvbiBzbyBvbmx5IG9uZSBpcyBhbGxvd2VkIG9uIGVh
Y2ggZW5naW5lICovDQo+ID4gQEAgLTIxOCw2ICsyMzMsOSBAQCBzdGF0aWMgdm9pZCBzcGluX2Fs
bChpbnQgaTkxNSwgY29uc3QgaW50ZWxfY3R4X3QgKmN0eCwgdW5zaWduZWQgaW50IGZsYWdzKQ0K
PiA+ICAgCQlpZ3Rfc3Bpbl9mcmVlKGk5MTUsIHNwaW4pOw0KPiA+ICAgCQlwdXRfYWhuZChhaG5k
KTsNCj4gPiAgIAl9DQo+ID4gKw0KPiA+ICsJaWYgKHNoYXJlZF92bV9pZCkNCj4gPiArCQlnZW1f
dm1fZGVzdHJveShpOTE1LCBzaGFyZWRfdm1faWQpOw0KPiA+ICAgfQ0KPiA+ICAgDQo+ID4gICBz
dGF0aWMgYm9vbCBoYXNfdXNlcnB0cihpbnQgZmQpDQo+IA0K
