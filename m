Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77D1BCCD19F
	for <igt-dev@archiver.kernel.org>; Mon, 20 Oct 2025 16:26:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F2F310E2A6;
	Mon, 20 Oct 2025 16:26:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eRTDMgrI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4F7410E2A6
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Oct 2025 16:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760977616; x=1792513616;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=eF8G/Bf1a2pS1b+ciXhJft4cssHKSMHQpa2TsJ4LitA=;
 b=eRTDMgrIuov4bdJLxS8g+2yH46CEOsrT9vEAWAsDM9xi+X/wQsFPZGqC
 O0AJiSZgh3D9DC279vDkwUQ1pCdybRzac1QaxaQqjfsY6rtCtbIDevyPO
 HKCNoO7UvyomOChtybQItYGLsyIp5bmUhQyO4KAQ6xX3eddIXmaedWA1Z
 hIJvk2AMw30Gthen9gu+O7ZxT5tMl0P2O87bHUncKp6ABdwVXwEPwxEU5
 XMMObDc3w1wZKhWW1652OJa/ll6IK9jz63nvt/Hlv90GHZ7TlOPGYkxr0
 1G99XUk6X8liL7v1VCtquVSiYDq2A/4fYcuF6UVqnudk+8pv4JrRYc6F4 w==;
X-CSE-ConnectionGUID: K77kKwdrSZikFw7Ze0BYag==
X-CSE-MsgGUID: cV5i3u2LTfS7FCH9deNoxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62127886"
X-IronPort-AV: E=Sophos;i="6.19,242,1754982000"; d="scan'208";a="62127886"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 09:26:55 -0700
X-CSE-ConnectionGUID: wiRsQqNJTpqsdruLunu5Mg==
X-CSE-MsgGUID: iVvB+tIVRSa5nWERKHqx3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,242,1754982000"; d="scan'208";a="213983779"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 09:26:56 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 20 Oct 2025 09:26:54 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 20 Oct 2025 09:26:54 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.65) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 20 Oct 2025 09:26:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pKqXZomBVseVocSQ8JKbrIcmvl3FOKBZsYyfgbaibgk3URzUp3ZqowNWxjulThRmQx2Y/cNjYtACtUJfUJGXXp/rZ5b5EX9KyxF5/bT2ACAiBw3ZNKhCdsNDQgXIt3AlQ94Rbgt/73/EoO3XCtLO8jyYh17MHYxzWMSbmWgL6EEAX7m5n+EfDELVIDPpfhX14GkOCdGIi6MsFnOwhfY7j17XfZo2kFccFAXD3sD4JjndMhslKejcpbmg8TgRiVlIVQvxHLnDLtkvEtZmgzXOwsoBj8TR7Gm1spcUpVmjYq+AXPy8zmUydKSJCgTB5xXN8fO0Gf8pDzqub6N9432cgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ouDbUYP08f0tchK9OIzErs6HyZhut/rj3qPSt6pVkbo=;
 b=VAl49b5Imh/FPQllBwuVdepAYe8vtJuOSJ2FPui2bUt7XQtZLcjynVy9q3NOjx0D4BTNQFVYXF4k4c6JGobdpf/PjWlrAxXXXDxrijWZ6RfCtIEdprP23ngpDdyaJPanJGuSLCgN0zcQnRUC7QUQUs4zbEHXk00AE9fD9l74Kk0LOlo1ly3F35OIm/R1rf3yy2lPCuHMVVDQKPNqOn0Q5ydjvTTaRS77fZVYD1G6+pq6lP39SHqUx/nKdMNBmwKi73q2QHL8IZWM5dW8gKQXJf8yN4Yp40ycFF97w+Pa3YbvCK9YieznmtysMve/VrlmymnU8hPNZi5LJljS6pK6ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by PH3PPF2CAD058EC.namprd11.prod.outlook.com (2603:10b6:518:1::d12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Mon, 20 Oct
 2025 16:26:51 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%4]) with mapi id 15.20.9228.015; Mon, 20 Oct 2025
 16:26:51 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>, Marcin Bernatowicz
 <marcin.bernatowicz@linux.intel.com>
Subject: [PATCH v1 1/3] lib/xe_mmio: Introduce tile-level XE MMIO access
 helpers
Date: Mon, 20 Oct 2025 18:26:31 +0200
Message-ID: <20251020162633.2622396-2-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251020162633.2622396-1-piotr.piorkowski@intel.com>
References: <20251020162633.2622396-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DU2PR04CA0259.eurprd04.prod.outlook.com
 (2603:10a6:10:28e::24) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|PH3PPF2CAD058EC:EE_
X-MS-Office365-Filtering-Correlation-Id: a20ff8c5-05dc-428e-22d2-08de0ff57982
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a3M3cUNQRURDUWpSS1dMK1dSKzVEZ0JraURjOXVJZTdsWURET1Y5U1lxUmh1?=
 =?utf-8?B?bDZjK1dLMHo3UGQzTjBCZVRITjFkNmlBVnlDYWxjUnVIcFZON0s2QWU4R3Fh?=
 =?utf-8?B?aGRXdmpKNjRiS0E4VFNBOTBKc3NLaGtmcEZyMHV5N3lZVWxnSk1nZmlpaHFG?=
 =?utf-8?B?a0hZRzlTeVRONytoSHAzd2djVHRoZTR4cGd2Sk5Rc3FSU1VxcU05SktQTTho?=
 =?utf-8?B?bGhGalJ5MVBCcHZEc0QyYmJETDB5a0EzWmtqQThnLzZTUUloS0ViTXM1M2ly?=
 =?utf-8?B?ZDNZQUM3QnIxRnVubWowc1FzZVIvSFovd1hkQ0ZSMFYxZGl1NzE0c1UvTWxl?=
 =?utf-8?B?bXFDTnRLSnNGbGxyTE1aV0kvb2Q2MEF1ZEc3ZzZTZCtYWTlMQ1NDTURpOXhp?=
 =?utf-8?B?VlVRdmZaa3ZOdUE0MEZVU2tuNGpXNjBMSXlsWlN1QmZWeUN1YmJqL0ZWMW5q?=
 =?utf-8?B?cWx0L3daVFh5M3J3YnY5TE0wZElWYjN4TDdNU2d3WFdZRDgrSytrVjI1V0xj?=
 =?utf-8?B?ZndZTVI4N3B5SFo1ZFh1TWpvZmkzSVFnbUpZWml2OVI4WEUxbzQ2Q3pNSmR4?=
 =?utf-8?B?clJPeE90WVVwWnhxSmtHQStBODJPNTVXUFdiK0tyYThvT0FJTG02MzRjSG1u?=
 =?utf-8?B?QmRiNExSL0tha2E1OW1tUGR5UXV5dTdJWTVpYkM2dEVUeVJzbUltYnFMSjly?=
 =?utf-8?B?LzRmSmVhS0hCUWxKb2R5Yi9pVVJyRG9yV2R2c3ZITEw2eUxNbzV1Y21tRXZY?=
 =?utf-8?B?SXBvbFkrRkcrOFlwM2twcmxnY0IrRWVKT1dRZUx0d05OSkx0TmZIYWFvWi8v?=
 =?utf-8?B?d2kyTVZHakFTWC9CSEFUbHJwaGMrQVN3aXFXeHNqVyszTnZybVhNd0s4SjY3?=
 =?utf-8?B?Y0lMc1ZlejZjWVZYTEFybjg4WnF3eHMrME0wbHlDWVJYWW4vbzNPMk5VSWhj?=
 =?utf-8?B?dGxoQmE0SSt1QmVKM0EzOGNoUFRKeUFlY29zanVFckpzQjNsaHB5WFpLVlAr?=
 =?utf-8?B?UjJnQUozKzYvcTJNU3ZSM3pMdlQrL0ZrbE1hdmFjTHBwbzVpUnppUVNXd2VX?=
 =?utf-8?B?VlZlQlU2Y0M4dmZZK0JvVDFRK3hlRk10VWdzQWluSS84Z1F0QTdMbVB0RGRh?=
 =?utf-8?B?aXNYTWQrSjhENFVIVURGL2QvdTQxbVdnd2EvVExnV1VYT2xKUlBKT29uU1l3?=
 =?utf-8?B?VkllWGhOTXhUWTM0S21ZTkVhcHozYlBiTjRVd1diaDMwNFV1ZCthSUJnYm03?=
 =?utf-8?B?YTZENEZ6MlB3a0YvMnhPVEZEZ1RidWVRdkl2aGNNRnZmTTJDdHhxMEFMRm5O?=
 =?utf-8?B?MWUrNjBsYmh4UU1TOVVmcENCMkVrZGV3ZklrODZqdVFiY1BZaXg4ZHZBVXhB?=
 =?utf-8?B?ZjFNV21Zd014SmZIY1loMWNpc0NXT0p2NjlqR2hCMS9wNzVzcWo1K1NWRkg5?=
 =?utf-8?B?RHpyM0tGOHdjTHpEbDRISnpFSFg2RmtUS0NLYkNFektScUx6SE1wMWhQZlht?=
 =?utf-8?B?Q0RDNE9mV0h0Ym1tRjR4K3RXRjREUTVTR3RUMGJWTUZTRzI3UkdMZ3NxR1h6?=
 =?utf-8?B?ckdUMG51bk90MW9IUHR6Z0N5bmYxcmFhVjgrRjYwRUFVQ3VuUkZNZThXeHpV?=
 =?utf-8?B?OTUyekZJM1g4YTdobUZsVzQ5bVVCT1lTNHR3Mk5hK3l4M0FRUlFKeHJwYUpS?=
 =?utf-8?B?YmpNVEU5TmlnZmtGWjA1UmFUNU9oMWVJTlFDRGQ0dUZaYnlFMFJLRDRBanl5?=
 =?utf-8?B?RjlHYTBsa2FmZTNWZUZFNU9XSllaZCtZS2xtRE9FMXIrRmEwY28ydlNHSTJk?=
 =?utf-8?B?TVJsQlR6Q1U2V3BiYisyOWJ5YlFIb3ZLSDlwdUJRQk9OeTZDWEdCQzB3OEZB?=
 =?utf-8?B?NlFjOVNHZmRqUmRpbjVUbEROYzVWbC96ekh1a3luSjJ5OVlrajcwNUh0M1Mr?=
 =?utf-8?Q?QLU7YmWgWH1W0Uo0upOHAwZwXIFSd2zt?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NUhNSjdxUm1OTXlmWGhIUzRBdUVvZlZZam92b2tHeGQ5cUg4MDEyZXRRMlN4?=
 =?utf-8?B?a3paTVlUZlZJSElYSmdiRzB0M1p6RXdoUE5OTkV5LzV1L2lGQXhlZXV3K3Zo?=
 =?utf-8?B?ZDZMWk45ZllsdU5jZmtxREYzbi9IMGZOWFFWV3AyM0hrRk9KdVdoVEZIcVE5?=
 =?utf-8?B?dndWVTU2U1RPa2l5eGRoOTVsSUNieGExNW5nRWQ2TlpZTWpHai8yOVFHNzBC?=
 =?utf-8?B?RVZYbzdWaHlQRzdZclhCeWphZ0NnMk1LRVg5NFFjQVJBanRJTHVCaWs1N1Jh?=
 =?utf-8?B?MTVuWStnc3I1RmM2d0N5SktmeG1WckU5UlFWZWhkeVlKelA1ZzlSUzBqWmti?=
 =?utf-8?B?cnJnZ2pGaEo2SlJOd054eWZ0WWVFRHorRkRsQ1hDd3B5S1EydW81QStoMllV?=
 =?utf-8?B?dFNEbDJZZG8zQVc4OXZsOE9lYUhWdFVWUnNkM05hbmZKcVE5aHdRWDFKNC9E?=
 =?utf-8?B?dzk0SGloLzBZbmFxcTlMOEtXWVEzcENHdTRFV3NkUFgySXRJUWtpZitheitC?=
 =?utf-8?B?UHVnN0xLK24zelZrZUxxQlpFdlduNDJBbWE2MGtkL1BKSkRNaDlpRk5FeGQ0?=
 =?utf-8?B?bDdidWttdTFnZUtDREZPWm9BOWFXV0sxV0ZGZDdFMkd2OEgyZ09kUWUvL0k1?=
 =?utf-8?B?TEwwTUhXbEVmYkhwVG8weDJOWkR3TWRWRWJRZTN6ZG8rZ1pEdHNoRFhtdmQx?=
 =?utf-8?B?T2w5U0V6UW0rNTZyRnl6YnU3TGRsV09vaVd6TlZuVUNQQkRzTW50Q2ZHdGRW?=
 =?utf-8?B?a3MzK1FmdTZnTkJmM3Z6dEF0a0JFMHlWVzhhbi9URG9XMlg1aU1SQy9MTWgz?=
 =?utf-8?B?OHIxSzR3V2pLc2c3eGxhc2QwVXZTZzFMNThCZ1ZjdE56NjBpSmtCL0pBUzZM?=
 =?utf-8?B?dVJCOVYzQXZWYlhUeUFBY0ZhT1ZjK3hrbmlzZmdpc3ZML0NwOG80b2VJVlhH?=
 =?utf-8?B?bjlQbGwxUlVBMTZ1cWo5MkNqNFhXVGZ1VEYrKy9CV2xVaWxseXdpZE9PbXJZ?=
 =?utf-8?B?YS9scmRaUkJ4bFF4YU1WVG9NWFMwMlNEczFubHNKRmZ6cER5YXdZS2JMMnBa?=
 =?utf-8?B?WngxNURLSlcrNEJ1cmZRQkg1Y0J6VDdCZzdQODNxU0dvNXIrVUZ5MjN6WEJw?=
 =?utf-8?B?MEdpT1dSVzRwUGdsak9RUmpscUxNNkJsZCtObjVtbjMra29tNno3Y2RSTXha?=
 =?utf-8?B?a1lTWEZtelNkTEtHL25xRGZOT1cwU2VGNERsSlFwNkxSRzA2Q2drNzd0UFRX?=
 =?utf-8?B?OGQrNXJjVEFOK2cwWHh1cGxGaXR3YTJiQ1BhT2Z2dUZPM056aVVGRUtuZEtJ?=
 =?utf-8?B?VG9XWFd6b2R6bWF5eXRMMVM2MXdZdUdmbEQwL2MzWXRBSWt1VU9SeHE0L3lq?=
 =?utf-8?B?WDFJK2s2cWJOS2FhdkpIQSs1Nncvb1UrNHVIVHVWaTNKV1doRzVvZGU5SjNh?=
 =?utf-8?B?MU5GTmJnVnUwV3NpK0VnVXB0ampJTzZ0RU4vSFpqWldJQnhPQURrTCsrMVNo?=
 =?utf-8?B?Z1NuNVk2TklMUzhGQzNXc0tOOExaMlc1RmtCcHhwNkxkbkpUSW52WTB1SDB4?=
 =?utf-8?B?R2hOM2dwTDl5S01NWWZFeHdJVXQwY1NUN2FQZnhNcXlHR2hqT0dPdE82VWFO?=
 =?utf-8?B?alRDMzlMZmtXTDkwNVNKMnZqTStoNCs2S3hsc3NXc2JsQ0JjbTdTLzJxOWto?=
 =?utf-8?B?NFk5VHl3WFZPeFhjQnlMMHdPakVUUzZza1Qxbkw3RjUxQ1N5M2ZFU1JXdkI3?=
 =?utf-8?B?bjltYzd6d1EvY05aZExxZ3BXZHFaVW5ncjM3Yys4R0ZxcXJQZk5uYnZGeGp1?=
 =?utf-8?B?RHc1aUVjeGRKdFJkK3ZmRkdnMkNHdDlRU3NMN05sMXNRZHIzY1hnTU1oMjFO?=
 =?utf-8?B?a1p1TGZCL0EyS3l6R1RRbkQ1MVpKc1VCM0hyWHB0aFZOTmFWMHpTVEl4REls?=
 =?utf-8?B?bWdIdlljeEMvSTBjTEdNUUZvdHh5M0szS2xYdmlXUGtMK3NidW10Y3lBcXlG?=
 =?utf-8?B?cVFieWxNSkRyUFR3bWFMTVErMzhobGx1Kyt4OWsrK1FTQUIrNm4ydUVia3NO?=
 =?utf-8?B?SUZTK1lGOGRiNzlhSW9ZWnBBa1d4TVVwYWJRNlNUVE84TGhDbUY0dFRUUUFx?=
 =?utf-8?B?UDdIR0plNTgzZkdyWitQK0hSeWYwS21xbFh0WmVpdG9xc1ZSc1JMNGduUUR5?=
 =?utf-8?B?Y2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a20ff8c5-05dc-428e-22d2-08de0ff57982
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2025 16:26:51.6629 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /TfS/qpBuOVEAUEBCKMcW8N8J3ezu+cvYwVLnWVPy/sfHkGfYAAqwf6PmtQcjM0qZnk/ddY/LVnSsSrWu8FPBQm0yfJP4s03lDhzy+Pcyco=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF2CAD058EC
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

From: Piotr Piórkowski <piotr.piorkowski@intel.com>

Add new helpers for tile-based MMIO access:
 - xe_mmio_tile_read32()
 - xe_mmio_tile_read64()
 - xe_mmio_tile_write32()
 - xe_mmio_tile_write64()

These functions provide explicit MMIO read/write operations within
a given tile by applying TILE_MMIO_SIZE offsetting logic. Existing
GT-level MMIO helpers (xe_mmio_gt_*()) are refactored to use these
new tile-level accessors, simplifying code and improving consistency
across MMIO operations.
GGTT is also a per-tile resource, so let's adjust the GGTT access
helpers to use tile IDs instead of GT.

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
---
 lib/xe/xe_mmio.c               | 94 ++++++++++++++++++++++++++--------
 lib/xe/xe_mmio.h               | 20 +++++---
 lib/xe/xe_sriov_provisioning.c |  6 +--
 lib/xe/xe_sriov_provisioning.h |  2 +-
 tests/intel/xe_sriov_flr.c     | 10 ++--
 5 files changed, 95 insertions(+), 37 deletions(-)

diff --git a/lib/xe/xe_mmio.c b/lib/xe/xe_mmio.c
index 834816133..8bc446fb9 100644
--- a/lib/xe/xe_mmio.c
+++ b/lib/xe/xe_mmio.c
@@ -107,6 +107,62 @@ void xe_mmio_write64(struct xe_mmio *mmio, uint32_t offset, uint64_t val)
 	return iowrite64(mmio->intel_mmio.igt_mmio, offset, val);
 }
 
+/** xe_mmio_tile_read32:
+ * @mmio: xe mmio structure for IO operations
+ * @tile: tile id
+ * @offset: mmio register offset in the tile
+ *
+ * 32-bit read of the register at @offset in the specified @tile
+ *
+ * Returns: The value read from the register.
+ */
+uint32_t xe_mmio_tile_read32(struct xe_mmio *mmio, uint8_t tile, uint32_t offset)
+{
+	return xe_mmio_read32(mmio, offset + (TILE_MMIO_SIZE * tile));
+}
+
+/** xe_mmio_tile_read64:
+ * @mmio: xe mmio structure for IO operations
+ * @tile: tile id
+ * @offset: mmio register offset in the @tile
+ *
+ * 64-bit read of the register at @offset in the specified @tile
+ *
+ * Returns: The value read from the register.
+ */
+uint64_t xe_mmio_tile_read64(struct xe_mmio *mmio, uint8_t tile, uint32_t offset)
+{
+	return xe_mmio_read64(mmio, offset + (TILE_MMIO_SIZE * tile));
+}
+
+/**
+ * xe_mmio_tile_write32:
+ * @mmio: xe mmio structure for IO operations
+ * @tile: tile id
+ * @offset: mmio register offset in the @tile
+ * @val: value to write
+ *
+ * 32-bit write to the register at @offset in the specified @tile
+ */
+void xe_mmio_tile_write32(struct xe_mmio *mmio, uint8_t tile, uint32_t offset, uint32_t val)
+{
+	xe_mmio_write32(mmio, offset + (TILE_MMIO_SIZE * tile), val);
+}
+
+/**
+ * xe_mmio_tile_write64:
+ * @mmio: xe mmio structure for IO operations
+ * @tile: tile id
+ * @offset: mmio register offset in the @tile
+ * @val: value to write
+ *
+ * 64-bit write to the register at @offset in the specified @tile
+ */
+void xe_mmio_tile_write64(struct xe_mmio *mmio, uint8_t tile, uint32_t offset, uint64_t val)
+{
+	xe_mmio_write64(mmio, offset + (TILE_MMIO_SIZE * tile), val);
+}
+
 /**
  * xe_mmio_gt_read32:
  * @mmio: xe mmio structure for IO operations
@@ -118,9 +174,9 @@ void xe_mmio_write64(struct xe_mmio *mmio, uint32_t offset, uint64_t val)
  * Returns:
  * The value read from the register.
  */
-uint32_t xe_mmio_gt_read32(struct xe_mmio *mmio, int gt, uint32_t offset)
+uint32_t xe_mmio_gt_read32(struct xe_mmio *mmio, uint8_t gt, uint32_t offset)
 {
-	return xe_mmio_read32(mmio, offset + (TILE_MMIO_SIZE * xe_gt_get_tile_id(mmio->fd, gt)));
+	return xe_mmio_tile_read32(mmio, xe_gt_get_tile_id(mmio->fd, gt), offset);
 }
 
 /**
@@ -134,9 +190,9 @@ uint32_t xe_mmio_gt_read32(struct xe_mmio *mmio, int gt, uint32_t offset)
  * Returns:
  * The value read from the register.
  */
-uint64_t xe_mmio_gt_read64(struct xe_mmio *mmio, int gt, uint32_t offset)
+uint64_t xe_mmio_gt_read64(struct xe_mmio *mmio, uint8_t gt, uint32_t offset)
 {
-	return xe_mmio_read64(mmio, offset + (TILE_MMIO_SIZE * xe_gt_get_tile_id(mmio->fd, gt)));
+	return xe_mmio_tile_read64(mmio, xe_gt_get_tile_id(mmio->fd, gt), offset);
 }
 
 /**
@@ -148,10 +204,9 @@ uint64_t xe_mmio_gt_read64(struct xe_mmio *mmio, int gt, uint32_t offset)
  *
  * 32-bit write to the register at @offset in tile to which @gt belongs.
  */
-void xe_mmio_gt_write32(struct xe_mmio *mmio, int gt, uint32_t offset, uint32_t val)
+void xe_mmio_gt_write32(struct xe_mmio *mmio, uint8_t gt, uint32_t offset, uint32_t val)
 {
-	return xe_mmio_write32(mmio, offset + (TILE_MMIO_SIZE * xe_gt_get_tile_id(mmio->fd, gt)),
-			       val);
+	return xe_mmio_tile_write32(mmio, xe_gt_get_tile_id(mmio->fd, gt), offset, val);
 }
 
 /**
@@ -163,38 +218,37 @@ void xe_mmio_gt_write32(struct xe_mmio *mmio, int gt, uint32_t offset, uint32_t
  *
  * 64-bit write to the register at @offset in tile to which @gt belongs.
  */
-void xe_mmio_gt_write64(struct xe_mmio *mmio, int gt, uint32_t offset, uint64_t val)
+void xe_mmio_gt_write64(struct xe_mmio *mmio, uint8_t gt, uint32_t offset, uint64_t val)
 {
-	return xe_mmio_write64(mmio, offset + (TILE_MMIO_SIZE * xe_gt_get_tile_id(mmio->fd, gt)),
-			       val);
+	return xe_mmio_tile_write64(mmio, xe_gt_get_tile_id(mmio->fd, gt), offset, val);
 }
 
 /**
  * xe_mmio_ggtt_read:
  * @mmio: xe mmio structure for IO operations
- * @gt: gt id
- * @offset: PTE offset from the beginning of GGTT, in tile to which @gt belongs
+ * @tile: tile id
+ * @offset: PTE offset from the beginning of GGTT in @tile
  *
- * Read of GGTT PTE at GGTT @offset in tile to which @gt belongs.
+ * Read of GGTT PTE at GGTT @offset in the @tile.
  *
  * Returns:
  * The value read from the register.
  */
-xe_ggtt_pte_t xe_mmio_ggtt_read(struct xe_mmio *mmio, int gt, uint32_t offset)
+xe_ggtt_pte_t xe_mmio_ggtt_read(struct xe_mmio *mmio, uint8_t tile, uint32_t offset)
 {
-	return xe_mmio_gt_read64(mmio, gt, offset + GGTT_OFFSET_IN_TILE);
+	return xe_mmio_tile_read64(mmio, tile, offset + GGTT_OFFSET_IN_TILE);
 }
 
 /**
  * xe_mmio_ggtt_write:
  * @mmio: xe mmio structure for IO operations
- * @gt: gt id
- * @offset: PTE offset from the beginning of GGTT, in tile to which @gt belongs
+ * @tile: tile id
+ * @offset: PTE offset from the beginning of GGTT in @tile
  * @pte: PTE value to write
  *
- * Write PTE value at GGTT @offset in tile to which @gt belongs.
+ * Write PTE value at GGTT @offset in the @tile.
  */
-void xe_mmio_ggtt_write(struct xe_mmio *mmio, int gt, uint32_t offset, xe_ggtt_pte_t pte)
+void xe_mmio_ggtt_write(struct xe_mmio *mmio, uint8_t tile, uint32_t offset, xe_ggtt_pte_t pte)
 {
-	return xe_mmio_gt_write64(mmio, gt, offset + GGTT_OFFSET_IN_TILE, pte);
+	return xe_mmio_tile_write64(mmio, tile, offset + GGTT_OFFSET_IN_TILE, pte);
 }
diff --git a/lib/xe/xe_mmio.h b/lib/xe/xe_mmio.h
index f144d4b53..f15017c96 100644
--- a/lib/xe/xe_mmio.h
+++ b/lib/xe/xe_mmio.h
@@ -29,13 +29,17 @@ uint64_t xe_mmio_read64(struct xe_mmio *mmio, uint32_t offset);
 void xe_mmio_write32(struct xe_mmio *mmio, uint32_t offset, uint32_t val);
 void xe_mmio_write64(struct xe_mmio *mmio, uint32_t offset, uint64_t val);
 
-uint32_t xe_mmio_gt_read32(struct xe_mmio *mmio, int gt, uint32_t offset);
-uint64_t xe_mmio_gt_read64(struct xe_mmio *mmio, int gt, uint32_t offset);
-
-void xe_mmio_gt_write32(struct xe_mmio *mmio, int gt, uint32_t offset, uint32_t val);
-void xe_mmio_gt_write64(struct xe_mmio *mmio, int gt, uint32_t offset, uint64_t val);
-
-xe_ggtt_pte_t xe_mmio_ggtt_read(struct xe_mmio *mmio, int gt, uint32_t pte_offset);
-void xe_mmio_ggtt_write(struct xe_mmio *mmio, int gt, uint32_t pte_offset, xe_ggtt_pte_t pte);
+uint32_t xe_mmio_tile_read32(struct xe_mmio *mmio, uint8_t tile, uint32_t offset);
+uint64_t xe_mmio_tile_read64(struct xe_mmio *mmio, uint8_t tile, uint32_t offset);
+void xe_mmio_tile_write32(struct xe_mmio *mmio, uint8_t tile, uint32_t offset, uint32_t val);
+void xe_mmio_tile_write64(struct xe_mmio *mmio, uint8_t tile, uint32_t offset, uint64_t val);
+
+uint32_t xe_mmio_gt_read32(struct xe_mmio *mmio, uint8_t gt, uint32_t offset);
+uint64_t xe_mmio_gt_read64(struct xe_mmio *mmio, uint8_t gt, uint32_t offset);
+void xe_mmio_gt_write32(struct xe_mmio *mmio, uint8_t gt, uint32_t offset, uint32_t val);
+void xe_mmio_gt_write64(struct xe_mmio *mmio, uint8_t gt, uint32_t offset, uint64_t val);
+
+xe_ggtt_pte_t xe_mmio_ggtt_read(struct xe_mmio *mmio, uint8_t tile, uint32_t pte_offset);
+void xe_mmio_ggtt_write(struct xe_mmio *mmio, uint8_t tile, uint32_t pte_offset, xe_ggtt_pte_t pte);
 
 #endif	/* XE_MMIO_H */
diff --git a/lib/xe/xe_sriov_provisioning.c b/lib/xe/xe_sriov_provisioning.c
index ff9d1f7d2..2ca73d2ef 100644
--- a/lib/xe/xe_sriov_provisioning.c
+++ b/lib/xe/xe_sriov_provisioning.c
@@ -90,7 +90,7 @@ static int append_range(struct xe_sriov_provisioned_range **ranges,
 /**
  * xe_sriov_find_ggtt_provisioned_pte_offsets - Find GGTT provisioned PTE offsets
  * @pf_fd: File descriptor for the Physical Function
- * @gt: GT identifier
+ * @tile: Tile id
  * @mmio: Pointer to the MMIO structure
  * @ranges: Pointer to the array of provisioned ranges
  * @nr_ranges: Pointer to the number of provisioned ranges
@@ -106,7 +106,7 @@ static int append_range(struct xe_sriov_provisioned_range **ranges,
  *
  * Returns 0 on success, or a negative error code on failure.
  */
-int xe_sriov_find_ggtt_provisioned_pte_offsets(int pf_fd, int gt, struct xe_mmio *mmio,
+int xe_sriov_find_ggtt_provisioned_pte_offsets(int pf_fd, uint8_t tile, struct xe_mmio *mmio,
 					       struct xe_sriov_provisioned_range **ranges,
 					       unsigned int *nr_ranges)
 {
@@ -122,7 +122,7 @@ int xe_sriov_find_ggtt_provisioned_pte_offsets(int pf_fd, int gt, struct xe_mmio
 
 	for (uint32_t offset = START_PTE_OFFSET; offset < MAX_PTE_OFFSET;
 	     offset += sizeof(xe_ggtt_pte_t)) {
-		pte = xe_mmio_ggtt_read(mmio, gt, offset);
+		pte = xe_mmio_ggtt_read(mmio, tile, offset);
 		vf_id = (pte & vfid_mask) >> GGTT_PTE_VFID_SHIFT;
 
 		if (vf_id != current_vf_id) {
diff --git a/lib/xe/xe_sriov_provisioning.h b/lib/xe/xe_sriov_provisioning.h
index e1a9d0a63..1e1dca866 100644
--- a/lib/xe/xe_sriov_provisioning.h
+++ b/lib/xe/xe_sriov_provisioning.h
@@ -92,7 +92,7 @@ struct xe_sriov_provisioned_range {
 
 const char *xe_sriov_shared_res_to_string(enum xe_sriov_shared_res res);
 bool xe_sriov_is_shared_res_provisionable(int pf, enum xe_sriov_shared_res res, unsigned int gt);
-int xe_sriov_find_ggtt_provisioned_pte_offsets(int pf_fd, int gt, struct xe_mmio *mmio,
+int xe_sriov_find_ggtt_provisioned_pte_offsets(int pf_fd, uint8_t tile, struct xe_mmio *mmio,
 					       struct xe_sriov_provisioned_range **ranges,
 					       unsigned int *nr_ranges);
 const char *xe_sriov_shared_res_attr_name(enum xe_sriov_shared_res res,
diff --git a/tests/intel/xe_sriov_flr.c b/tests/intel/xe_sriov_flr.c
index aabbd8c05..59e4d215c 100644
--- a/tests/intel/xe_sriov_flr.c
+++ b/tests/intel/xe_sriov_flr.c
@@ -493,20 +493,20 @@ struct ggtt_data {
 
 static xe_ggtt_pte_t intel_get_pte(struct xe_mmio *mmio, int gt, uint32_t pte_offset)
 {
-	return xe_mmio_ggtt_read(mmio, gt, pte_offset);
+	return xe_mmio_ggtt_read(mmio, 0, pte_offset);
 }
 
 static void intel_set_pte(struct xe_mmio *mmio, int gt, uint32_t pte_offset, xe_ggtt_pte_t pte)
 {
-	xe_mmio_ggtt_write(mmio, gt, pte_offset, pte);
+	xe_mmio_ggtt_write(mmio, 0, pte_offset, pte);
 }
 
 static void intel_mtl_set_pte(struct xe_mmio *mmio, int gt, uint32_t pte_offset, xe_ggtt_pte_t pte)
 {
-	xe_mmio_ggtt_write(mmio, gt, pte_offset, pte);
+	xe_mmio_ggtt_write(mmio, 0, pte_offset, pte);
 
 	/* force flush by read some MMIO register */
-	xe_mmio_gt_read32(mmio, gt, GEN12_VF_CAP_REG);
+	xe_mmio_tile_read32(mmio, 0, GEN12_VF_CAP_REG);
 }
 
 static bool set_pte_gpa(struct ggtt_ops *ggtt, struct xe_mmio *mmio, int gt, uint32_t pte_offset,
@@ -548,7 +548,7 @@ static int populate_ggtt_pte_offsets(struct ggtt_data *gdata)
 	gdata->pte_offsets = calloc(num_vfs + 1, sizeof(*gdata->pte_offsets));
 	igt_assert(gdata->pte_offsets);
 
-	ret = xe_sriov_find_ggtt_provisioned_pte_offsets(pf_fd, gt, gdata->mmio,
+	ret = xe_sriov_find_ggtt_provisioned_pte_offsets(pf_fd, 0, gdata->mmio,
 							 &ranges, &nr_ranges);
 	if (ret) {
 		set_skip_reason(&gdata->base, "Failed to scan GGTT PTE offset ranges on gt%u (%d)\n",
-- 
2.34.1

