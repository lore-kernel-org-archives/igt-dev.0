Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6ACCCD5BAE
	for <igt-dev@archiver.kernel.org>; Thu,  5 Sep 2024 12:25:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79D9810E110;
	Thu,  5 Sep 2024 12:25:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H3SzUALt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6302610E110
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Sep 2024 12:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725539119; x=1757075119;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Bvmq7WMwNXqyas3CHAiAMT2zYU5DTtZ64b7yTyb2SOs=;
 b=H3SzUALtJg8VChOPOlJG7yuUlbeQyXgjHH1LWPptjuMzkihxhVePdx8/
 O7qNfp8nMQQeVBncVYVwRe/ZVOF18I+/8EmUoZym5bPVvjwl4rlqSabIV
 kT7CKyc82gnerOip/E1lmeaHzkilYkAtm8UEIMb9o+FtXm1D8OCnEGC1s
 epu/XEQpSj/hxS3BaD5YQv9BY4TT4KqbzgRbruNGVfG51C3Q9rzNGcVV5
 l7xbQlKsve9XW8CEIkH0U76X/BZhnWwnJ0cm7ejUUzqycyqLIJLKuYjvn
 FjHg2LpoMOK2KTsVNNKXNWevRI4cbisEPwPbUocZx2l+s6HGBKYH4NmVL g==;
X-CSE-ConnectionGUID: b69Y/umMT1iUamE+PoNReQ==
X-CSE-MsgGUID: u0WL8kteSqiur28qERMHxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11185"; a="24443184"
X-IronPort-AV: E=Sophos;i="6.10,204,1719903600"; d="scan'208";a="24443184"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2024 05:25:19 -0700
X-CSE-ConnectionGUID: jkgGzdUyRgqGv8fNdN9LWA==
X-CSE-MsgGUID: RygjLQPzRoWwPvN1NyneAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,204,1719903600"; d="scan'208";a="70202099"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Sep 2024 05:25:19 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 5 Sep 2024 05:25:18 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 5 Sep 2024 05:25:18 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 5 Sep 2024 05:25:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NBHfVymzPwFPEW8DLQ8kP9TASNaaK3/7c73P4ZZx+VLGSH9gxNV2k+lZdPGPrl5lrGJ/6utjoYERWhKpdFFilkRLkt/xg06VEh/To9NDE5pmkts42vZsWQBseKcLNnHQGhcCdtJpp0EvmSwXYwjFMt8rcpLmS+rO4LEIXpp76m/XXK1rYnuEHbsjnAn8WmgDA/Po1P5QbLDQ7l3gyMupWdVnt8kl0nMNQUjelJsOK6pOyMOj+lIji5ZCILipyuMbl249Sqt90la/FRgq+k5lo/JVSjlFvEZ4d4yCypinHNFKFNloCY85IQ9lBa1eL/thmdFipRZgz4GUchAGm9rjDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bvmq7WMwNXqyas3CHAiAMT2zYU5DTtZ64b7yTyb2SOs=;
 b=dhZTy8u/48mO/v5DhbLo/rc7O86FF1z5V+1TalXijxRs3kccIIlggqtin6mA+N1nWoWO+AHdTxi7gxUV2kvvo8PpTxFgT88Z291A9nWW7PSMgBuddTr0svDiYXzNdZhS0Fk5/lQjNPuSCiybJzlZKwxI4jpnji6G2PXjkKaeKW349j2VXKLlegj+1xmRYPxLY8iWZjEpT9VuOfi8Agkp4aXLkwqTr06RxQlIuXpcSGj1HFPefdRejQ6S1vkUbZ8K6gnYYw6wFkKy1TlBJoD4ga63Cf4vlwUwvo+Q0PPsZjF3DKD3S1A60YluclnqKRWhXjhvcZiaN6yVrOm3XQCIIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 DM6PR11MB4644.namprd11.prod.outlook.com (2603:10b6:5:28f::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7918.27; Thu, 5 Sep 2024 12:25:16 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::fc1:e80f:134c:5ed2]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::fc1:e80f:134c:5ed2%3]) with mapi id 15.20.7918.024; Thu, 5 Sep 2024
 12:25:16 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>
CC: "Joshi, Kunal1" <kunal1.joshi@intel.com>
Subject: Re: [PATCH i-g-t v1 1/1] lib/igt_psr: Remove SRD status change check
 for DP2.1 Panel Replay
Thread-Topic: [PATCH i-g-t v1 1/1] lib/igt_psr: Remove SRD status change check
 for DP2.1 Panel Replay
Thread-Index: AQHa/3En4UGLHln/CEW8eyP9Ky0OiLJJHm4A
Date: Thu, 5 Sep 2024 12:25:16 +0000
Message-ID: <5ee8aa973fdfc87d5d4a1922f0f1a4eff3bb6695.camel@intel.com>
References: <20240905085315.1566848-1-ramanaidu.naladala@intel.com>
 <20240905085315.1566848-2-ramanaidu.naladala@intel.com>
In-Reply-To: <20240905085315.1566848-2-ramanaidu.naladala@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|DM6PR11MB4644:EE_
x-ms-office365-filtering-correlation-id: af5e542c-4696-4a08-0c4c-08dccda5cc75
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?WUlSN3g2NnlSUUxPVXQ1S1JveDlxODlHYVFVQ1BNWDNkVzUrcE5aRkFGUUtx?=
 =?utf-8?B?N3hpMUlZbVhSUW1XZVkvK3ViVFVNb1prMm9FeFF6cVdJclBhcmQxdytHNDJ5?=
 =?utf-8?B?aGd5MkZIRWdpLzkrT1NQK25ZTU1CT0EyV1REL3pocnBaRnk0UWVWa2hXWTl0?=
 =?utf-8?B?dlh4S013N01KN040NjZubDZSZndZRmpITFJjTWpEM1dTdHF0VVNUMVZCdjVG?=
 =?utf-8?B?UmZxZkFOYk9DLzJ0emdqZFVrWGQrYnZkQTM1YStnczlxYnJON3hVdU52ZkxL?=
 =?utf-8?B?V1drOGlGWVc3SXFvR0hrUjc1Ym93eHB5Yk5JS2RMZGRCc1M3UkluREZMZ3dW?=
 =?utf-8?B?dXdQWHdOb1JHUUxWK0xsTmFZeFhPcHAzaFNHZDZiVVNlUHh4bC8xVVg5SXJK?=
 =?utf-8?B?QmZvYTlIQkQ2VTRKaXNSa1dwdXZWUnVINHljNEhGRndzQzlDMlFtS2poSDNL?=
 =?utf-8?B?N1p6UlllR3VtRks5RWNWWWg4OVBLb2Y2ZGEzdVJ3aU5yc1JqaG9UZkhTdldj?=
 =?utf-8?B?YVpEUXdoaERCejBNb1JVUmMrdjA0Mm5XcHFkMUhqL0tOR3FSZFREcHJhQXp1?=
 =?utf-8?B?S1c4MWl2eUcxMGNRUFJMbHhIN2dsTXQxY3pPRy9iWGxHUzRyY1RZMDhqalBv?=
 =?utf-8?B?UDNqY2tENTVTYmovWm5BSzg4MVBwMHVBRzZyRGJCWVlaQ09vWkwzQmwwQTBs?=
 =?utf-8?B?RExVRVk2N2ExMzJlYmxEMWk3TEwyeEJxQTkzZTdTZU5EZmZETXVPUjg4WkpQ?=
 =?utf-8?B?MFNkYlpoeC93bytTdTdBZ1BLTHVndFM3ZXRaOUgzb2dZZE5SRWJ4YlZQS1Rj?=
 =?utf-8?B?WTdGcDk5UU1sRytXMTBpeWdGUUluZXE4aHBZdEt3bVFGRG9EVENvcGpnTkU3?=
 =?utf-8?B?SjZ5cGllUE15NU5DbFRGV1hVT3pZRTBFNS9kZU9xUkw4TEZEb1FGNGFraUdw?=
 =?utf-8?B?S0U0U0J3OGZpMjJtY0NrRFE5aVJOS0VwZHJpM0tIdExtUHhzTnJIdU9LLy91?=
 =?utf-8?B?Y1E5Nm1RRWF5bHQ2MkJSM1BEcjBGclpjY1QwcFFOM1k1S0FWVEgzZHlGeDB4?=
 =?utf-8?B?bFB5M2NrNVNCRnV2NmR1bmhiSHBnUUhpZDdNdVZaMk1iQWJrSSs2VXBIamlu?=
 =?utf-8?B?eEVVSWp6NjhHMnpuRWFyZ2wwZXVlWVo0Rk5KT0QzVTdsSnpCY2tqZlgrZE0x?=
 =?utf-8?B?UTJUWFpodjVhSkFtTVFsYlFqb2dPd3g3ZFNmcXVDTk16UFhTcEZNZVk5NjhQ?=
 =?utf-8?B?dFBSaFAvZVQ4YzFhQkY0Zk8rN3ZJM3VWRHVjc09XQ1lVTmh5QnVmc045TFZO?=
 =?utf-8?B?MWoyK0NVbGR0NDlOMWNiWFFGQmFEbTYraTFaWU5CRk1Qenh3aWJ5KzZLRzlT?=
 =?utf-8?B?R1JmZGdQdnVmcHlTd0wxYlhHRUlwTGJSWmpFbWM1ajAwY0Q4dDJKK0NpUzNa?=
 =?utf-8?B?Tmg4dEFCR0QvWWdKNVNaZTNEYUhNejdwQ2NXaEt6YVYveUtWK0I0aDYza2Q4?=
 =?utf-8?B?ZEVWYVpWWmRmdzNvbzU1Ky96Ny9Vb2VoTnBsbXRsOG1IRXhwT3RXNlk3MVlI?=
 =?utf-8?B?YWlNbFA2N3NUelBzNllpbVpXRlg3ZjNoTUJaNU8zS3IrQVdpckZyYU9FOTNv?=
 =?utf-8?B?WDJJSGR4WURPMFJvYkxaRVRRVVBqWUdpbjlPQUI0Mmt6MGhid3VneTJka3Bj?=
 =?utf-8?B?QUcvYlV6ZVBmeWJWTUJMeURyRy9rS2JYWUxGMEJ2anA5OTRoaGlKSnpOQTBu?=
 =?utf-8?B?UzEwT3puK08ycWZjVHhDQ1RIcDVEUGRXN0dqSUZoRG8zK1hlS1g3ZmR1Mm9u?=
 =?utf-8?B?Z250M1JLYmtBd0hxZ0FDdzdlUDlNeThObGRNRE9nOWhFZGNORWpObXVIL04z?=
 =?utf-8?B?Z3N1b21HVVpNUVpBV0pXMWh5UzJoNDFaL1hUdzlZcWtsSUE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QjNLTlBBRFdEbXJmajRYTjBrTitMeFBNYWtlR3hhZHFPaHhLSzg1bGROT0NK?=
 =?utf-8?B?V1dNU3FKUzBubllRNEsvOUxmUHNWVjIzczNOaFd2KzR4bmpveXhCQzkyQzVa?=
 =?utf-8?B?bEVLenoyR2l4ZjgvclR4bnNSbjR1UW9ZYVRScXcxZU11NTl5UEhPa096UXZ2?=
 =?utf-8?B?TXM2TlMvVDRaNXdMNGpzVzc1WmRrZllMNkNsMmdZTFhrS1pOYmJpTmFvcjRi?=
 =?utf-8?B?MWVqODR1YVNDOXFRaUpDaW1pZGlDV1hjcmhWRStNZTN3bStvdk5pYWhibnkx?=
 =?utf-8?B?L0UyYjFubGVLN3VZLzNXOGF5RUxMRVZGVWszelZ6UURDN2pSeEIxRS9aMmFE?=
 =?utf-8?B?WFNnOTd2WVcyUytFTG44VWFwSjVpOTN6ckc2WGZHdm1kOGcwWE91WFdLTFRQ?=
 =?utf-8?B?aWgyc1RMc29odTRIK0ZiYUFKTXdZQXFUcmhVNFFwd3JMaTg5QzdaVmwxeG9E?=
 =?utf-8?B?UHlsdVVCcUtSUzk3S1Jrc2hwUXMrelpKQ1dZcllDT2UzVmU2dGtDWWVidGUr?=
 =?utf-8?B?cHdVeTdnREdxeVJPaTVvTzl4a0k0SmZCU0g5K2MyMVZjSk1KKytweHlZdUl6?=
 =?utf-8?B?eDBZNFpIdk9UejF0cmlMYURzUjl1NVVVS2MyYlQwQW9lamNSNmVkSnVqczlV?=
 =?utf-8?B?QUR0UmQ2RkZMQ042ZE9nbXVPaGk0bGduclBRNE1Ta2NNQ2s4NHBLTTBnbmlq?=
 =?utf-8?B?TE5rWGl6QUhma2t6VkNHbG5VS2daZllGV0lYTFJqQ3Fodys2T1pzNVNZMzhT?=
 =?utf-8?B?bzFHQ2tMQjdMcWIrY3BuMWZkUXpaSHp4cm5yNXh6bExCTHBQQmJWdUVHckpJ?=
 =?utf-8?B?TWdMMTI5eXVWS2FJenpMZ2lmN2x3WUJqb1oxMDhTQVRkSVlra05kTlZoWFFP?=
 =?utf-8?B?MlhrclluVUJqbU1kSEVaRHpQY3FVK2dTM2ZvMlZQRXQrZlg0Tk1wMkFvWUdl?=
 =?utf-8?B?dzJJdGo1a3FaYnpVSWNsMmc1K0pEcU00OWlrd0lQcHI0RHdSb1ZMZXFjbERD?=
 =?utf-8?B?QXYyUlNNdHNQZkxiL3FBNG1DcXg1TFhSaUJraGhJb3JKVlM3alJ4VVI3VTFo?=
 =?utf-8?B?T2R0SlkwZVZIaXdQQkMzZ2h4blp0YmJSRXVYamNOYVB2K1ZHYlNHMDROazdy?=
 =?utf-8?B?d1ZwdHhzdGsvdXRhQ2JRbkkvcjFtbW9BVmI0ZXpTSGRiMEFDR3BtQ2t2cEho?=
 =?utf-8?B?azZqeWZHNnJDNWhvWkduZzNta052Y2c1RmloUlduN014UDI3ZU4vN1poK1lN?=
 =?utf-8?B?L2podCtVSld6cGt5TW9ib0dVM1huL1pZbW1FS2RBMlhKQmNoZWdSNC9oUVF5?=
 =?utf-8?B?UzFwL09SazhaazBvK3VYbURVZzVkN2UzMlJJNEdiTTdLck42R1BXWlI2TVI4?=
 =?utf-8?B?S3E2TnpTKzNxTGU2UFA1alJaSEJsUFdkMlVBdjk0WE9qell1VlliWU0rUnFS?=
 =?utf-8?B?bDIzL2RNUDVFSElJcGIxWnRWUGU2YTFwdTI3dU1UNDVZS3c2c2RyMnVwOEFO?=
 =?utf-8?B?dVVxMjBrQjcxVC9SZ2hWYWMzbUZBNUpjYmVwVE1lMXE4bVVJeEw2V2ZmTTlC?=
 =?utf-8?B?M2U2K3QrdkRQV28yN3JxejBCekNXbW9YcHROeVNJMEFsOFIwcjFoVTZBdnFk?=
 =?utf-8?B?SG5XL21NN0t2ZzlCZTRHOWkvcEQ3L1lMVjdGeFpCWXJ3QUp2SkxRNGkzZThI?=
 =?utf-8?B?VENQS041SlJEWGZQTUpWZDNZMCtJNTdkSkRlU3U2Z0FWWVdobks1ck9PTW9E?=
 =?utf-8?B?dDJobFJsalk1a2liSDlMOHRjMzg1dTFZQlcxRndWeCtkSlhLaDY0Vm9kL2FV?=
 =?utf-8?B?a3JzVnNCV0tadktHT2VWMFp2T1IrR3pKNkM4SEtBdzB5ZU5qLzIzY2tOZzdC?=
 =?utf-8?B?K1l4SDdGamFGS0p2bUdiNWVHQ2Q2VFBJc3RWMXRONGs1dWc1TktTWTdpb2Fp?=
 =?utf-8?B?NHVzSC80enV6MDVsMEU2SFBlUkVrUXpHeGhoQVRwZ25GNnNGQzNsd0xnT0dj?=
 =?utf-8?B?MzRwSitXN3A0ZGgrcXM3cUlhVkFLdEpjNHlYQUp2L3NDZlJLcHl1MlNpdkVU?=
 =?utf-8?B?QVZMM1NxNjYzRFRnekdvdERGbTcyTjJTRFdVWVFFS254M3NaRDc2VFZCR1R6?=
 =?utf-8?B?ZHBpSjlyUXRvWFowbTJqSFRYa2MwQ01CQzFVeVovSlFZYjdqd2p0aWFFeVdt?=
 =?utf-8?B?REE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <59B3E8FB0B22CE4E91E93001B77E7E41@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af5e542c-4696-4a08-0c4c-08dccda5cc75
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Sep 2024 12:25:16.2847 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +Cxdyq/UzZa0pExGIHWs9c46M/Q/uyOcdmqh0qamiiORPw3mqOvjqgJ/4pnH34DY8EeaRDv3dmMo+rTVIQ04Z2xSewefmAp1LYb5jVRk3JI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4644
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

T24gVGh1LCAyMDI0LTA5LTA1IGF0IDE0OjIzICswNTMwLCBOYWxhZGFsYSBSYW1hbmFpZHUgd3Jv
dGU6DQo+IFdlIGRvIG5vdCBoYXZlIEFMUE0gb24gdGhlIERQMi4xIFBhbmVsIFJlcGxheS4gRHVl
IHRvIHRoaXMsIHRoZQ0KPiBTUkRfU1RBVFVTIFtTUkQgU3RhdGVdIGRvZXNuJ3QgY2hhbmdlIGZy
b20gU1JERU5UX09OIGFmdGVyIFBhbmVsDQo+IFJlcGxheSBpcyBlbmFibGVkIHVudGlsIGl0IGdl
dHMgZGlzYWJsZWQuIEFzIGEgcmVzdWx0LCB0aGUgaWd0DQo+IHRlc3RzIGZhaWwuIFRvIHJlc29s
dmUgdGhpcyBpc3N1ZSwgYWRkIGEgY29uZGl0aW9uIHRvIHNraXAgdGhlDQo+IGNoZWNrIGluIHRo
ZSAncHNyX3dhaXRfdXBkYXRlJyBhbmQgJ3Bzcl9sb25nX3dhaXRfdXBkYXRlJw0KPiBmdW5jdGlv
bnMgZm9yIERQMi4xIFBSLg0KPiANCj4gdjE6IFVwZGF0ZSBjaGFuZ2UgZm9yIGFsbCB1c2VycyBv
ZiBwc3Jfd2FpdF91cGRhdGUgYW5kDQo+IMKgwqDCoCBwc3JfbG9uZ193YWl0X3VwZGF0ZS4gKEpv
dW5pKQ0KPiANCj4gU2lnbmVkLW9mZi1ieTogTmFsYWRhbGEgUmFtYW5haWR1IDxyYW1hbmFpZHUu
bmFsYWRhbGFAaW50ZWwuY29tPiANCj4gLS0tDQo+IMKgbGliL2lndF9wc3IuYyB8IDIwICsrKysr
KysrKysrKysrKysrKy0tDQo+IMKgMSBmaWxlIGNoYW5nZWQsIDE4IGluc2VydGlvbnMoKyksIDIg
ZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvbGliL2lndF9wc3IuYyBiL2xpYi9pZ3Rf
cHNyLmMNCj4gaW5kZXggZTNlNzU3N2ViLi4yNjc3ZDQ4MjIgMTAwNjQ0DQo+IC0tLSBhL2xpYi9p
Z3RfcHNyLmMNCj4gKysrIGIvbGliL2lndF9wc3IuYw0KPiBAQCAtMTEzLDEyICsxMTMsMjggQEAg
Ym9vbCBwc3Jfd2FpdF9lbnRyeShpbnQgZGVidWdmc19mZCwgZW51bQ0KPiBwc3JfbW9kZSBtb2Rl
LCBpZ3Rfb3V0cHV0X3QgKm91dHB1dCkNCj4gwqANCj4gwqBib29sIHBzcl93YWl0X3VwZGF0ZShp
bnQgZGVidWdmc19mZCwgZW51bSBwc3JfbW9kZSBtb2RlLA0KPiBpZ3Rfb3V0cHV0X3QgKm91dHB1
dCkNCj4gwqB7DQo+IC3CoMKgwqDCoMKgwqDCoHJldHVybiBpZ3Rfd2FpdCghcHNyX2FjdGl2ZV9j
aGVjayhkZWJ1Z2ZzX2ZkLCBtb2RlLCBvdXRwdXQpLA0KPiA0MCwgMSk7DQo+ICvCoMKgwqDCoMKg
wqDCoC8qDQo+ICvCoMKgwqDCoMKgwqDCoCAqIFRPRE86IEFmdGVyIGVuYWJsaW5nIFBhbmVsIFJl
cGxheSBvbiBEUDIuMSwgb2JzZXJ2ZSB0aGF0DQo+IHRoZSBTUkQgc3RhdHVzDQo+ICvCoMKgwqDC
oMKgwqDCoCAqIHJlbWFpbnMgaW4gdGhlIFNSREVOVF9PTiBzdGF0ZS4gUmVtb3ZlIHRoZSBwb2xs
aW5nDQo+IG1lY2hhbmlzbSBmb3IgdGhlIFNSRA0KPiArwqDCoMKgwqDCoMKgwqAgKiBzdGF0dXMg
Y2hhbmdlIGZvciB0aGUgRFAyLjEgb3V0cHV0Lg0KPiArwqDCoMKgwqDCoMKgwqAgKi8NCj4gK8Kg
wqDCoMKgwqDCoMKgaWYgKG91dHB1dC0+Y29uZmlnLmNvbm5lY3Rvci0+Y29ubmVjdG9yX3R5cGUg
PT0NCj4gRFJNX01PREVfQ09OTkVDVE9SX0Rpc3BsYXlQb3J0KQ0KPiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgcmV0dXJuIGlndF93YWl0KHBzcl9hY3RpdmVfY2hlY2soZGVidWdmc19m
ZCwgbW9kZSwNCj4gb3V0cHV0KSwgNDAsIDEpOw0KPiArwqDCoMKgwqDCoMKgwqBlbHNlDQo+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gaWd0X3dhaXQoIXBzcl9hY3RpdmVf
Y2hlY2soZGVidWdmc19mZCwgbW9kZSwNCj4gb3V0cHV0KSwgNDAsIDEpOw0KPiDCoH0NCj4gwqAN
Cj4gwqBib29sIHBzcl9sb25nX3dhaXRfdXBkYXRlKGludCBkZWJ1Z2ZzX2ZkLCBlbnVtIHBzcl9t
b2RlIG1vZGUsDQo+IGlndF9vdXRwdXRfdCAqb3V0cHV0KQ0KPiDCoHsNCj4gLcKgwqDCoMKgwqDC
oMKgcmV0dXJuIGlndF93YWl0KCFwc3JfYWN0aXZlX2NoZWNrKGRlYnVnZnNfZmQsIG1vZGUsIG91
dHB1dCksDQo+IDUwMCwgMSk7DQo+ICvCoMKgwqDCoMKgwqDCoC8qDQo+ICvCoMKgwqDCoMKgwqDC
oCAqIFRPRE86IEFmdGVyIGVuYWJsaW5nIFBhbmVsIFJlcGxheSBvbiBEUDIuMSwgb2JzZXJ2ZSB0
aGF0DQo+IHRoZSBTUkQgc3RhdHVzDQo+ICvCoMKgwqDCoMKgwqDCoCAqIHJlbWFpbnMgaW4gdGhl
IFNSREVOVF9PTiBzdGF0ZS4gUmVtb3ZlIHRoZSBwb2xsaW5nDQo+IG1lY2hhbmlzbSBmb3IgdGhl
IFNSRA0KPiArwqDCoMKgwqDCoMKgwqAgKiBzdGF0dXMgY2hhbmdlIGZvciB0aGUgRFAyLjEgb3V0
cHV0Lg0KPiArwqDCoMKgwqDCoMKgwqAgKi8NCj4gK8KgwqDCoMKgwqDCoMKgaWYgKG91dHB1dC0+
Y29uZmlnLmNvbm5lY3Rvci0+Y29ubmVjdG9yX3R5cGUgPT0NCj4gRFJNX01PREVfQ09OTkVDVE9S
X0Rpc3BsYXlQb3J0KQ0KPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIGln
dF93YWl0KHBzcl9hY3RpdmVfY2hlY2soZGVidWdmc19mZCwgbW9kZSwNCj4gb3V0cHV0KSwgNTAw
LCAxKTsNCj4gK8KgwqDCoMKgwqDCoMKgZWxzZQ0KPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgcmV0dXJuIGlndF93YWl0KCFwc3JfYWN0aXZlX2NoZWNrKGRlYnVnZnNfZmQsIG1vZGUs
DQo+IG91dHB1dCksIDUwMCwgMSk7DQoNClRoaXMgYWN0dWFsbHkgc2hvd3MgdGhhdCB3ZSBuZWVk
IHRvIGFkZCBTUkRFTlRfT04gaW50bw0KcHNyX2FjdGl2ZV9jaGVjay4gTWF5YmUgeW91IGNvdWxk
IGRvIGFkZCBzZWNvbmQgcGF0Y2ggdG8gdGhpcyBzZXQ/DQoNCkJSLA0KDQpKb3VuaSBIw7ZnYW5k
ZXINCg0KPiDCoH0NCj4gwqANCj4gwqBzdGF0aWMgc3NpemVfdCBwc3Jfd3JpdGUoaW50IGRlYnVn
ZnNfZmQsIGNvbnN0IGNoYXIgKmJ1ZiwNCj4gaWd0X291dHB1dF90ICpvdXRwdXQpDQoNCg==
