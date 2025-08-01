Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19474C87FCB
	for <igt-dev@archiver.kernel.org>; Fri,  1 Aug 2025 08:21:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FA0B10E2F0;
	Fri,  1 Aug 2025 08:21:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AQ8BDaC2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 728EA10E2F0
 for <igt-dev@lists.freedesktop.org>; Fri,  1 Aug 2025 08:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754036465; x=1785572465;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=24zn0KhwDJANNSMeOh3j+MbdqCtcRT6X27ec6rB/tU8=;
 b=AQ8BDaC2t9FdVMuRO41IxjJArHfhtYwVZ3YFUyojBBd+XLOScwltDFa0
 7HtyzRMqfvRjAw0NAEzAuPeBpv2Uwj8gDj2FFk0fS3sE2AiMa0AkmjRAd
 RoHF1IIiUIG+VA1zYn9p28temiVaeQnJtu6Yspag/zkK8S0RxaUFErf47
 6I9vCyvf+wNT7JH3dBocn2ytC2+nQLk6988p4Jxo+xkCCmrnhdHyc4Swy
 wuHvYertJxaBzyfZNO9KBqgO43C5ccnpZNapwN9BLoisC4SH6yOt6W8Vg
 JeQmyeh7CUcH/WkfNEXYJqwWlvF8LGQ103guwtdXBAJX1uSaFK/6J/npc A==;
X-CSE-ConnectionGUID: N8wGcqHhTb2cUGxpY/N/9w==
X-CSE-MsgGUID: mqLnZSTIRyKt+b14/Wn0xw==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="56244132"
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="56244132"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2025 01:21:04 -0700
X-CSE-ConnectionGUID: gUeRLoMGR7e8BDa6dD5xTw==
X-CSE-MsgGUID: W2jJCMhfS5mrJaCfjAXpyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="162781918"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2025 01:21:03 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 1 Aug 2025 01:21:03 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Fri, 1 Aug 2025 01:21:03 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.77) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 1 Aug 2025 01:21:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sHrrYSreqM5Re0MTD1p22/VPdU16HlYGzWdR70aJVokl0pLT0P8Ehf8jBr68mMPkg1k3SplFhtKG9pmt1Fvpi8DvMK0Jcxzt2qVi5FcwnHjzu7HRe8xneBkPH/R4VAzvp7oeB1XEPi9NzrZb4nn/K7lOtrT9UEpJC9BO8x3IbThZJwBtpUOIFp8ICqQz5alIQOAZmUWgKdw3Cq25nQC4k7jqy4Wf7WcAFaLMDrS+EAbFWNHMY5UXBPQ9FcHl0U8NPHF4MYkB2K3AehxzC3Fs2AeXa64haDQdyynQSh5y9Lgrxsf1Bsakn+UhELOHJv7e1cyBEzQt3s+/LA1Rh7guPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=24zn0KhwDJANNSMeOh3j+MbdqCtcRT6X27ec6rB/tU8=;
 b=AVGf3XiQPFJ8gg2JkgJ4GsDJKdp8lZ+nUAch5B8TaA0BiF4xQfOSkBmKMOH9yHog4hlwq/zH+keNkI58VjMIuAmVOlfcOc9f/TFlWJsJVDz27SKPdOVtLhN4PxWdvn2X2USN1oXNd+XnFprnDq4VI+7NqtkRusBi+57Vf3fOK5AsBHqRHsDnQCeVuNottTdxgaiz4Mai3scpJQij+xsc3Xpcs68fg3H9yDHAbts9a2r0pJs6tcYSvh8Z9z3ikB1XXWOmtgTG9gHj+E6i1GFvRL3Zvl02BJkRrpLf1FmT+88AM7veET6xVzFGAbVNPt+DHvLSh9LO3k/SIwfoFQ0niQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7733.namprd11.prod.outlook.com (2603:10b6:8:dc::19) by
 SJ1PR11MB6105.namprd11.prod.outlook.com (2603:10b6:a03:48c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.11; Fri, 1 Aug
 2025 08:20:45 +0000
Received: from DS0PR11MB7733.namprd11.prod.outlook.com
 ([fe80::41a9:1573:32ad:202c]) by DS0PR11MB7733.namprd11.prod.outlook.com
 ([fe80::41a9:1573:32ad:202c%5]) with mapi id 15.20.8989.011; Fri, 1 Aug 2025
 08:20:45 +0000
From: "Hellstrom, Thomas" <thomas.hellstrom@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
Subject: Re: [PATCH i-g-t] tests/xe_vm: Report OOM for vm_bind ioctl under
 memory pressure
Thread-Topic: [PATCH i-g-t] tests/xe_vm: Report OOM for vm_bind ioctl under
 memory pressure
Thread-Index: AQHcAWMDOTE36icrUEisXiCCAIeNZbRNd5MA
Date: Fri, 1 Aug 2025 08:20:45 +0000
Message-ID: <4d94967476d3430abd32d8266f1689db19359f44.camel@intel.com>
References: <20250730150228.3330352-1-priyanka.dandamudi@intel.com>
In-Reply-To: <20250730150228.3330352-1-priyanka.dandamudi@intel.com>
Accept-Language: en-SE, en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.54.3 (3.54.3-1.fc41) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7733:EE_|SJ1PR11MB6105:EE_
x-ms-office365-filtering-correlation-id: 6daadd7e-e534-415a-3311-08ddd0d45055
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|10070799003|376014|366016|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?ODR0cDNYbWlpOFFrN1BiOUZqV1JEWDV1dFJjK0xqOWV6QmJxT21KcllROEl2?=
 =?utf-8?B?OStuYm1Eelp3N3VNY3N3Qk9QSnRnOW96eFY2N0JZcEVsdG5leW03ZDFJOHNv?=
 =?utf-8?B?WGJEUFRFcGpySkZTUWVBSnA3SnNEaTdMdXNsa2NWbm9vQVdSNGxaSkZYUExN?=
 =?utf-8?B?WWllbE9JM3Bubm1CdUpRRVhCZHlVNDRnQ0UwRXdoVUlvaC8wUTl3V0Nka3B2?=
 =?utf-8?B?QkthMUhKQzkvYXpMNWNDUUllQ3lhbUxMeVNSbSsrdExrdFJCMzZTSzBzRXNZ?=
 =?utf-8?B?b2M3QzdYa09BVTMzdXVtblVZaHJrSWk5c3Q0V1k4RVluSmFnWDQ5OGdyYnF1?=
 =?utf-8?B?NERrOXRqTWFOSVM3TTZFQ3hoeU1UU3NQNVJtQ1l3UzFteUFMcFJ4Vmt0WjVL?=
 =?utf-8?B?L21YaTRCUzYxRGZSb01qeFloY29PcllFcTUxV3B2UktELzg4bGxjZnFSRVNj?=
 =?utf-8?B?YWhEZytxeFZleHZkZGRESU5zbVlJc3JWVFlab0FIanNiYXhPNVNqdkNPMWRZ?=
 =?utf-8?B?TGNpK1hGSy84eS90Sk9RL1d4SDVDSFZ2K1lRcUhMMzZuTUFaMzBJdkpXUytz?=
 =?utf-8?B?Vi96bkZzTTBjaUhIZytSQjBBZUN4QkFiVDh6S1F1eVdYNjNYcHlBdmFBRU5J?=
 =?utf-8?B?NHpRN1krVGNrMm9Va09QVlEzK1VudytRb3Y3M05OV2FDYkU2UFZzYVNVRzNs?=
 =?utf-8?B?SDk3U2hsb0JVWUVDR1lYbnlWYjd2amE2OW1NSmlPQU16YzBwSnNKMHpEVU1L?=
 =?utf-8?B?cjc1cjBrQWVTeDJCQnR5R012SWZXRlV1Q1A1bEpEaHVvNDFKbUJ3N2xEUmRR?=
 =?utf-8?B?WnBKeW93bGpIMlN0dzNqdmRtZUkxdGhvZ0kvSXIwVG5QTHBXTzZDdVJsZEhz?=
 =?utf-8?B?M05JMXdPWnM2WmFiVXA2ZjkxMjFGcVMxNy9TeDVGMkFjTVhlVTZneXVFay9o?=
 =?utf-8?B?T2dCV0J4emliazVmVmV0Q2d4Rzc2dkhwQVVVc01xYXNUbjlvQy95dkM0dHNU?=
 =?utf-8?B?dmJRYlJSZXV4SlNiejMxTks0cVR3RzRUMjR3Mlo2bzE4cXZIZlFOZis1VkZj?=
 =?utf-8?B?KzFXc0JPZERZMXVNb2E4cENDVkh5S3dsNXNwSklHMnJHN3o0Y2pOcFRWMGhZ?=
 =?utf-8?B?eWYwMDJjeTVCamEwTXFQdVFEYnNVNFBlSkdnODhlZ0lWcG53SzhQZjc4STUv?=
 =?utf-8?B?THlrK0hFbEtDVHVOei80M0JrejhQUlBOQUJFZ1V4emFya0EzbENMajRnMFRr?=
 =?utf-8?B?MkFNdFI2elh4R2NTSzZKZDJ6MEE1MFJxYm9FTnREOGx4VnIvY0FJNEFuRmNP?=
 =?utf-8?B?bEVIMktESkowVTF5WndHZzJDRWZlbE9Wc0F1THp0eENhNTJxVUY3NHlRaDNZ?=
 =?utf-8?B?NENFQytnVjlmcmVNcnY3VFZHYVRzTnNESk1qZXl6TVRwWTdIQUR0b2VVZjhD?=
 =?utf-8?B?bjRRL1MxbEE4K1RvV1RCcnpOclBYalA1MEVIUFpYMG5GTlUzSERLVlhiWVBQ?=
 =?utf-8?B?elpLVXgrRHc2clF1NGw0YUhqOGt2bzQ5VU10aEFUbjRhTFhnUGtEYTY1YjVs?=
 =?utf-8?B?OU53cnRDVEFNYmFGWjh5TWJxWFAwUGVHWk9hYm5MdWppK2dpVHA2Vzc2THB1?=
 =?utf-8?B?bFR0cFRMZG5nWnBueTJkVEdoUnBGbXNwWERMZHd5Tjl1VG8xZXRnS1YrV1Ir?=
 =?utf-8?B?eGFnQkJBOU5jallNdTBBZFhZeVRzbCtkbXkzSGgxa1E0VlNNaTVWTm5yL3gx?=
 =?utf-8?B?L2U1aVJpVlRzdXVqbXM3blZzR2pMN2E5L3hwZVR2emhWcnZiSmgwbGpjclcy?=
 =?utf-8?B?djEvK1JMQ3NQc3lvdCtreGRCek5qYXJETzFsSmdmUS9VMy9mQk9VaUthM3N6?=
 =?utf-8?B?eVhrcUEwOTNmbmlESWNoYjBrUHJrVCsxdVRIV1FtZEhLLy9aSnFGM3RwTGdu?=
 =?utf-8?B?bzNLajlBRmg3dnNkcFZBMitFNlZmZis3SVN0KytwaSt1anNhKzhpeFo0UWtF?=
 =?utf-8?B?RzFYcnp5QzRRPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7733.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(376014)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eDB4R0NpcUs0QXF5Tms0dGdYd3pTVWNJbmsrVE1jQ1d5QnRpTXpXSkltMGg1?=
 =?utf-8?B?N3UvSEltYWszTThSd0VPelhtYzE5TE5iREpGNnpBZWF2VUhhcXl5TVMzVFVP?=
 =?utf-8?B?V2h2ZmVLV2tCRVRTVG13RzVTQWd0c09oYmllSEJrVHdrRVZXNVh2Z25EcHhH?=
 =?utf-8?B?ZWFGVG4zWjVtOWN2b0krMlg5UzBCVHUrcnVQajN2SW9obkViSVZKRUxQWVk4?=
 =?utf-8?B?R24zcENtaHRya2QycGJTNGRhWlBPWWo2OXBQTHUyY3dLZy9IbFdibTljRVdP?=
 =?utf-8?B?cFBGcTc2eUZnaHg5bStpQWVMSUZXa0grVkFNM2pCalZtenBVOGM0VGsyQ3FP?=
 =?utf-8?B?M3hNMDB3V0FYcmFzRXQ4RGpoOEV2TDI2NWdpdG9qZ014VWxYdWIzNnd1Mkd4?=
 =?utf-8?B?a213dVdWM1U2M2lyeE9oTVNzTnRpQ08vWXNRY1Y0UjBkelV1RkY3a3JoRUFR?=
 =?utf-8?B?bjZGMnUwM2tUMWFxYks4eXN6WEI3aDBGcVM5ODFUdGhZekY0YWRTZnlCZkhH?=
 =?utf-8?B?RVMyYWV6Z0hXa21FMHhhWkYvT2xmODdoSmtIeXF5RFVMNXVabnpmT3FuZlZN?=
 =?utf-8?B?OXg2ME96dGtHT3htYmtkeVVwbDZmVGltWFVRb2lBSURhN1pzUXpnRWpIUnVY?=
 =?utf-8?B?dTFlek1HZXRaQ2NVN2crb3hqMUJGNzg1cGNYWTNwQW5FRmZYYXhHV2JaQ0NU?=
 =?utf-8?B?eXQ2RW9tVDNqZlB0RXFpdXdLK1JydzBHNHgyS2xaRVhTMUhvRFBYdDNTU3lL?=
 =?utf-8?B?bndCaEJ6Tk5Wa0w0dUt2NVAxKzNpTVBsVW9NVFRlT1AzVGNzWFNyV1B2Z1Iz?=
 =?utf-8?B?bUpvL3RPSGZTUllKZTUzTGtoRUZFNnJrSnBvVjcyMW1uKy8wdGNFRVoyYzVE?=
 =?utf-8?B?NUozb0w3Z1FkbDl3T3JMeVJ6UmRUUFBtNnQrNWszWmZ2TlR0aDBrTThVQjM0?=
 =?utf-8?B?Q21aSG5YN0ZVeERXbWhCWlVDQXJpdU5mdVZCRlJvYzdZaWJlMCtiaDl5ai9m?=
 =?utf-8?B?SEh4djZpU3RKV1VRSUV4dXhGN2RSQnloMmhZVktRRjRBRWdpUnRybWl2MXVm?=
 =?utf-8?B?c2M1QUNPUWJwTmREYnVpZHVDdHREVGJwTm55dGhRTncrSUdWWCtNc1ZjQURF?=
 =?utf-8?B?T3B2c3hXTzQyNVpOVTQzVDBZN1c0YzlVb2psT0hUdmZVd09zNWhmbTRUQW5j?=
 =?utf-8?B?SkwwUlppLzRmZzRkTWIvaDhsaEx6UndUOFZ4Vy91VkdLMUFzSmhpN1YvZEVF?=
 =?utf-8?B?SllvMGdDandRRFRFNzRoc295cXF6eHN1V2tIZSt3MkwrWlo1Wi9scEJId0ZI?=
 =?utf-8?B?TWQwa2tBS0srTG50K2dRYk5DdHIrdTZ1Ymw5OGNaS3lOSVJyaGhjajJQREVP?=
 =?utf-8?B?OEthY0ZmYWtRVG5kYkd1VjM1NmVHei9MTHdEZno1TkdpblFIczRGQTdMSWIv?=
 =?utf-8?B?MUdTc2JBam5NVGRZcmtTQm16VTgza080MEYrUVdURWc1L3BQcGhtNkdqOHpC?=
 =?utf-8?B?dXpLT0cwblNPclJVa0l3ZDFXWU1seGI3ZDlwcExxeHI0TDgybFV3Z2hRSnZv?=
 =?utf-8?B?b0tNa2ZNYUU3Q0VtQ1YrWXl2MVpPVWRBQ1h0ZGhxWFo2cGJ4My9SdEMrN3k1?=
 =?utf-8?B?TlRaRTJWMzVGSTFUNTFxUHNBa3JpMFRLSTd4ZFd1N21pbW5tZTYxRkRlejZs?=
 =?utf-8?B?ZVQ1WFdKSk1Fbm9CRHpZSGxFRCs0djdRZldYVllpM3Z2b2VFbE1vNUM3SnAr?=
 =?utf-8?B?L1NrR2s3SW55eVhMTjh1MHNDRks2MVZUWUFkeENia0lNYmtPMTk2YTF3UVFH?=
 =?utf-8?B?clprMDEyT2F1WkpEUit1TjlFRTh0QVVTTFk2T2JRd0F5TWdvOFZuRHZzSW9o?=
 =?utf-8?B?NHZRaHh6bDJUeGRQY3JKVm1Xd2c0ekErVGhWQzBmbjdaMkFGUDdMeEVLS1hp?=
 =?utf-8?B?Z0ZjUnhjaDNoaTJuOStNNFJiVUduU3J2SDQydWhNY2p5NVhZQmtnWW02Zmhn?=
 =?utf-8?B?bmd2akZWMEM5cWdBejZXTFpqK2NyQm5naklsNThWb2hpMGt0QjZGeXFIdDNZ?=
 =?utf-8?B?eGFHbVFtOTl2ZnVFMXNhSGhYcHg0SGtaWXM0V0p3Y00zMlR4eUtBRWwyWWsy?=
 =?utf-8?B?OWhTWDJZL3hYNmIyUytjL0Y4V1A2MmJ4bjVDd1RMdW9Mby80UytxNkJuYnF4?=
 =?utf-8?Q?gMxWRAyQz9L/aq76KjfkcnsxN+okML/zjFh3EQt2QlEy?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6B1B083E6FFAFA44AE8275564EFB7724@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7733.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6daadd7e-e534-415a-3311-08ddd0d45055
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2025 08:20:45.5804 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7Cx+qBNvVmmOaXWvULWukuGlys9GgCXFVpi0+v1tMD5/82xHyvy+sMk5sIKlJr8lPY5tKyreO0rSoEfuuQ/9FPf5kY3kaUWZEVzxn/o36zs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6105
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

T24gV2VkLCAyMDI1LTA3LTMwIGF0IDIwOjMyICswNTMwLCBwcml5YW5rYS5kYW5kYW11ZGlAaW50
ZWwuY29tIHdyb3RlOg0KPiBGcm9tOiBQcml5YW5rYSBEYW5kYW11ZGkgPHByaXlhbmthLmRhbmRh
bXVkaUBpbnRlbC5jb20+DQo+IA0KPiBBZGQgYSB0ZXN0IHdoaWNoIGNyZWF0ZSBidWZmZXIgb2Jq
ZWN0cyBvbiBhbiBMUiB2bSBhbmQgdm1fYmluZGluZw0KPiBidWZmZXIgb2JqZWN0cyBpbiBhIGxv
b3AgdW50aWwgaXQgcmVhY2hlcyBPT00uDQo+IFRoaXMgaXMgdG8gY2hlY2sgdGhhdCBidWZmZXIg
b2JqZWN0cyBvbiBhIHNpbmdsZSB2bSBkb2Vzbm90IGdldA0KPiBldmljdGVkDQo+IGFuZCBpbnN0
ZWFkIHJlcG9ydCB3aXRoIEVOT01FTSBvciBFTk9TUEMgaW4gbm9uIGZhdWx0IG1vZGUuDQo+IA0K
PiB2MjogV2hlbiB2bV9iaW5kIGZhaWxzIHdpdGggb29tIGV2ZW4gYmVmb3JlIHRoZSBtZW1vcnkg
YWxsb2NhdGlvbg0KPiBnb2VzDQo+IGJleW9uZCB2aXNpYmxlIHZyYW0gc2l6ZS4gVGVzdCBzaG91
bGQgc3RpbGwgcGFzcyB3aGVuIFZSQU0gaXMgc21hbGxlcg0KPiB0aGFuDQo+IGV4cGVjdGVkIG1h
eSBiZSBkdWUgdG8gbGVha2VkIFZSQU0gbWVtb3J5IHdpdGggYSB3YXJuaW5nLg0KPiBWTSBiaW5k
IGVycm9yIGNvdWxkIGJlIEVOT01FTSBvciBFTk9TUEMgZm9yIG9vbS4gVk0gYmluZCBzaG91bGQN
Cj4gaGFwcGVuDQo+IGF0IGxlYXN0IG9uY2UgZm9yIHNhbml0eSBjaGVjayBwdXJwb3NlLiBNb2Rp
ZmllZCBjb2RlIHRvIGhhbmRsZQ0KPiB0aGVzZSBjaGFuZ2VzLg0KPiANCj4gdjM6T3B0aW1pc2Vk
IGNvZGUgYW5kIHNvbWUgY29kaW5nIHN0eWxlcy4NCj4gDQo+IENjOiBUaG9tYXMgSGVsbHN0cm9t
IDx0aG9tYXMuaGVsbHN0cm9tQGludGVsLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogUHJpeWFua2Eg
RGFuZGFtdWRpIDxwcml5YW5rYS5kYW5kYW11ZGlAaW50ZWwuY29tPg0KDQpBIHBvc3NpYmxlIGlu
ZGVudGF0aW9uIGlzc3VlIGJlbG93Lg0KV2l0aCB0aGF0IGZpeGVkLA0KDQpSZXZpZXdlZC1ieTog
VGhvbWFzIEhlbGxzdHLDtm0gPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPg0KDQoN
Cg0KPiAtLS0NCj4gwqB0ZXN0cy9pbnRlbC94ZV92bS5jIHwgODANCj4gKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+IMKgMSBmaWxlIGNoYW5nZWQsIDgwIGlu
c2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS90ZXN0cy9pbnRlbC94ZV92bS5jIGIvdGVz
dHMvaW50ZWwveGVfdm0uYw0KPiBpbmRleCBjMWFiYjA4YmIuLmI4Y2E4YmQ4YSAxMDA2NDQNCj4g
LS0tIGEvdGVzdHMvaW50ZWwveGVfdm0uYw0KPiArKysgYi90ZXN0cy9pbnRlbC94ZV92bS5jDQo+
IEBAIC0yMzY4LDYgKzIzNjgsODAgQEAgc3RhdGljIHZvaWQgaW52YWxpZF92bV9pZChpbnQgZmQp
DQo+IMKgCWRvX2lvY3RsX2VycihmZCwgRFJNX0lPQ1RMX1hFX1ZNX0RFU1RST1ksICZkZXN0cm95
LCBFTk9FTlQpOw0KPiDCoH0NCj4gwqANCj4gKy8qKg0KPiArICogU1VCVEVTVDogb3V0LW9mLW1l
bW9yeQ0KPiArICogRGVzY3JpcHRpb246IFRlc3QgaWYgdm1fYmluZCBpb2N0bCByZXN1bHRzIGlu
IG9vbQ0KPiArICogd2hlbiBjcmVhdGluZyBhbmQgdm1fYmluZGluZyBidWZmZXIgb2JqZWN0cyBv
biBhbiBMUiB2bSBiZXlvbmQNCj4gYXZhaWxhYmxlIHZpc2libGUgdnJhbSBzaXplLg0KPiArICog
RnVuY3Rpb25hbGl0eTogb29tDQo+ICsgKiBUZXN0IGNhdGVnb3J5OiBmdW5jdGlvbmFsaXR5IHRl
c3QNCj4gKyAqLw0KPiArc3RhdGljIHZvaWQgdGVzdF9vb20oaW50IGZkKQ0KPiArew0KPiArI2Rl
ZmluZSBVU0VSX0ZFTkNFX1ZBTFVFIDB4ZGVhZGJlZWZkZWFkYmVlZnVsbA0KPiArI2RlZmluZSBC
T19TSVpFIHhlX2JiX3NpemUoZmQsIFNaXzUxMk0pDQo+ICsjZGVmaW5lIE1BWF9CVUZTICgoaW50
KSh4ZV92aXNpYmxlX3ZyYW1fc2l6ZShmZCwgMCkgLyBCT19TSVpFKSkNCj4gKwl1aW50NjRfdCBh
ZGRyID0gMHgxYTAwMDA7DQo+ICsJdWludDY0X3Qgdm1fc3luYzsNCj4gKwl1aW50MzJfdCBib1tN
QVhfQlVGUyArIDFdOw0KPiArCXVpbnQzMl90ICpkYXRhW01BWF9CVUZTICsgMV07DQo+ICsJdWlu
dDMyX3Qgdm07DQo+ICsJc3RydWN0IGRybV94ZV9zeW5jIHN5bmNbMV0gPSB7DQo+ICsJCXsgLnR5
cGUgPSBEUk1fWEVfU1lOQ19UWVBFX1VTRVJfRkVOQ0UsIC5mbGFncyA9DQo+IERSTV9YRV9TWU5D
X0ZMQUdfU0lHTkFMLA0KPiArCQnCoCAudGltZWxpbmVfdmFsdWUgPSBVU0VSX0ZFTkNFX1ZBTFVF
IH0sDQo+ICsJfTsNCj4gKwlzaXplX3QgYm9fc2l6ZSA9IEJPX1NJWkU7DQo+ICsJaW50IHRvdGFs
X2J1ZnMgPSBNQVhfQlVGUzsNCj4gKwlpbnQgYmluZF92bSA9IDA7DQo+ICsJYm9vbCBvb20gPSBm
YWxzZTsNCj4gKw0KPiArCXZtID0geGVfdm1fY3JlYXRlKGZkLCBEUk1fWEVfVk1fQ1JFQVRFX0ZM
QUdfTFJfTU9ERSwgMCk7DQo+ICsJZm9yIChpbnQgaXRlciA9IDA7IGl0ZXIgPD0gdG90YWxfYnVm
czsgaXRlcisrKSB7DQo+ICsJCWludCBlcnIgPSAwOw0KPiArDQo+ICsJCWJvW2l0ZXJdID0geGVf
Ym9fY3JlYXRlKGZkLCAwLCBib19zaXplLA0KPiArCQkJCQl2cmFtX2lmX3Bvc3NpYmxlKGZkLCAw
KSwNCj4gKwkJCQkJRFJNX1hFX0dFTV9DUkVBVEVfRkxBR19ERUZFUg0KPiBfQkFDS0lORyB8DQo+
ICsJCQkJCURSTV9YRV9HRU1fQ1JFQVRFX0ZMQUdfTkVFRFMNCj4gX1ZJU0lCTEVfVlJBTSk7DQo+
ICsNCj4gKwkJc3luY1swXS5hZGRyID0gdG9fdXNlcl9wb2ludGVyKCZ2bV9zeW5jKTsNCj4gKwkJ
ZXJyID0gX194ZV92bV9iaW5kKGZkLCB2bSwgMCwgYm9baXRlcl0sIDAsDQo+ICsJCQkJwqDCoCBh
ZGRyICsgYm9fc2l6ZSAqIGl0ZXIsIGJvX3NpemUsDQo+ICsJCQkJwqDCoCBEUk1fWEVfVk1fQklO
RF9PUF9NQVAsIDAsIHN5bmMsDQo+ICsJCQkJwqDCoCAxLCAwLCBERUZBVUxUX1BBVF9JTkRFWCwg
MCk7DQo+ICsNCj4gKwkJaWYgKGVycikgew0KPiArCQkJaWYgKGVyciA9PSAtRU5PTUVNIHx8IGVy
ciA9PSAtRU5PU1BDKSB7DQo+ICsJCQkJb29tID0gdHJ1ZTsNCj4gKwkJCQlicmVhazsNCj4gKwkJ
CX0NCj4gKwkJaWd0X2Fzc2VydF9mKGVyciwgIlVuZXhwZWN0ZWQgZXJyb3IgJWQgZm9yIHZtDQo+
IGJpbmRcbiIsDQo+ICsJCQnCoMKgwqDCoCBlcnIpOw0KDQpJbmRlbnRhdGlvbiBsb29rcyBzdXNw
aWNpb3VzIGhlcmUuDQoNCj4gKwkJfSBlbHNlIHsNCj4gKwkJCWJpbmRfdm0gPSBiaW5kX3ZtICsg
MTsNCj4gKwkJfQ0KPiArDQo+ICsJCXhlX3dhaXRfdWZlbmNlKGZkLCAmdm1fc3luYywgVVNFUl9G
RU5DRV9WQUxVRSwgMCwNCj4gTlNFQ19QRVJfU0VDKTsNCj4gKwkJdm1fc3luYyA9IDA7DQo+ICsJ
CWRhdGFbaXRlcl0gPSB4ZV9ib19tYXAoZmQsIGJvW2l0ZXJdLCBib19zaXplKTsNCj4gKwkJbWVt
c2V0KGRhdGFbaXRlcl0sIDAsIGJvX3NpemUpOw0KPiArCX0NCj4gKw0KPiArCWlndF9hc3NlcnRf
Zihvb20sICJPT00gc2NlbmFyaW8gaXMgbm90IHdvcmtpbmcgYXMNCj4gZXhwZWN0ZWRcbiIpOw0K
PiArDQo+ICsJaWYgKGJpbmRfdm0gPCB0b3RhbF9idWZzKQ0KPiArCQlpZ3Rfd2FybigiVlJBTSB3
YXMgc21hbGxlciB0aGFuIGVzdGltYXRlZCwiDQo+ICsJCQkgIm1heSBiZSBkdWUgdG8gbGVha2Vk
IFZSQU0gbWVtb3J5XG4iKTsNCj4gKw0KPiArCWZvciAoaW50IGl0ZXIgPSAwOyBpdGVyIDwgYmlu
ZF92bTsgaXRlcisrKSB7DQo+ICsJCXN5bmNbMF0uYWRkciA9IHRvX3VzZXJfcG9pbnRlcigmdm1f
c3luYyk7DQo+ICsJCXhlX3ZtX3VuYmluZF9hc3luYyhmZCwgdm0sIDAsIDAsIGFkZHIgKyBib19z
aXplICoNCj4gaXRlciwgYm9fc2l6ZSwNCj4gKwkJCQnCoMKgIHN5bmMsIDEpOw0KPiArCQl4ZV93
YWl0X3VmZW5jZShmZCwgJnZtX3N5bmMsIFVTRVJfRkVOQ0VfVkFMVUUsIDAsDQo+IE5TRUNfUEVS
X1NFQyk7DQo+ICsJCW11bm1hcChkYXRhW2l0ZXJdLCBib19zaXplKTsNCj4gKwkJZ2VtX2Nsb3Nl
KGZkLCBib1tpdGVyXSk7DQo+ICsJfQ0KPiArfQ0KPiArDQo+IMKgaWd0X21haW4NCj4gwqB7DQo+
IMKgCXN0cnVjdCBkcm1feGVfZW5naW5lX2NsYXNzX2luc3RhbmNlICpod2UsICpod2Vfbm9uX2Nv
cHkgPQ0KPiBOVUxMOw0KPiBAQCAtMjc1OSw2ICsyODMzLDEyIEBAIGlndF9tYWluDQo+IMKgCWln
dF9zdWJ0ZXN0KCJpbnZhbGlkLXZtLWlkIikNCj4gwqAJCWludmFsaWRfdm1faWQoZmQpOw0KPiDC
oA0KPiArCWlndF9zdWJ0ZXN0KCJvdXQtb2YtbWVtb3J5Iikgew0KPiArCQlpZ3RfcmVxdWlyZSh4
ZV9oYXNfdnJhbShmZCkpOw0KPiArCQlpZ3RfYXNzZXJ0KHhlX3Zpc2libGVfdnJhbV9zaXplKGZk
LCAwKSk7DQo+ICsJCXRlc3Rfb29tKGZkKTsNCj4gKwl9DQo+ICsNCj4gwqAJaWd0X2ZpeHR1cmUN
Cj4gwqAJCWRybV9jbG9zZV9kcml2ZXIoZmQpOw0KPiDCoH0NCg0K
