Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABF56C36002
	for <igt-dev@archiver.kernel.org>; Wed,  9 Apr 2025 08:42:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6281010E309;
	Wed,  9 Apr 2025 08:42:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DsjKiWNY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08FB310E309
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Apr 2025 08:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744188176; x=1775724176;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=iPOk5Qc4TV6/SvIasnBryxs6dy06izaxl9b0J7w8BYw=;
 b=DsjKiWNYZKbZddgWtxzpz9aBVdqMmpeMLN4MMeFZkndrr8DDrypn9Ebx
 xKr3QEQIIBF9Ua2piF4zruGlsBzyRKj4+1AGZT47TOfLWbV8bAsc1Yer0
 kIkiyezayTIQKNAzVe8myrpIy2ToPq8u8ipdzI7quXG++JXgDbHqKkvFP
 2bbFS45iei7gxAT0FOGK7SvaWClWs4mKY9EplLq1CW0JHItgfVMbcNX8L
 GW4eaV7yN1hzLUUv7qeZLbWuYCb+ocuXOsdh/vl+znhStv/G/eb35XBUw
 HYGVEluwtkzrUEJxxJAiEQJHu/KoSBpEUtgDiOwyNBUz02+2wazSn9df5 g==;
X-CSE-ConnectionGUID: yufhldaYRJerhQ6DXlr/kQ==
X-CSE-MsgGUID: 0RpUlyh1QiObP83lmWIeTA==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45537525"
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; d="scan'208";a="45537525"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2025 01:42:54 -0700
X-CSE-ConnectionGUID: 11T/KyxFReO0vqxz6AEH9g==
X-CSE-MsgGUID: HIOoktu8S068mWNiLzuleg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; d="scan'208";a="133387022"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2025 01:42:54 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 9 Apr 2025 01:42:53 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 9 Apr 2025 01:42:53 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.48) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 9 Apr 2025 01:42:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gtnxJkNJRdRc7rMisNGBbDHm6hoxLAOC+FK1VQfCFc+1sDy+7dwbZObCU/XkwOcBYnIyjID+g7wlEd4HqzsaOZbxhNMEA+jxriN5bEDShrRLpMF+n2CTYWQZ1yljp+7bAE+moSE/xTTdUv9p0vPr4rfosybkc1kWS616Wz/aZfG26ZdEB7DcnD25ZGnldQBTsV3cY1d2G41LQTzR9OVND5aiCGWEsC3nllurUA4Wv1ZG3dfwS2EHhetMrg6YkaYtTYzEZjjJHppT1Ubofo2cvVE45PlaUy8azelTKHHD4UqAi2VOzNY5dQN3ZrvJzQGypG5hH8DUe9rGlGooOxczLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iPOk5Qc4TV6/SvIasnBryxs6dy06izaxl9b0J7w8BYw=;
 b=ilCOUfGWnRWq3XksR5xJDYwn8jEFPmk23WND0EealnQpDnskUH56f6StOadwfKZRaGXls98wBCkZ3RVbYpK7EzevMK+cT4IWcHD7MJDXybpK6++elRuKBKj9nJT2Cc3HH+aFKQOBkeCHvi8A7K4vfPF8+4m7AQoWRG4xUZmdvNz4chmANU7NBDU7jUpAaRtE/t+uxnujmRl5Exd964KUy1fHJ+7Rwq/qWsbzDUForZgDIi8wHlFe1ihNNZuzUTYuy2PjOE6EhHZyWaZOq5ey2RlppC9UluYZfRRQhgqiciWIZ8fgQPMNti9hpJAhxPNCUWXs6ODQOeTcorBJXQkxRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by CY8PR11MB7082.namprd11.prod.outlook.com (2603:10b6:930:52::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.32; Wed, 9 Apr
 2025 08:42:51 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525%3]) with mapi id 15.20.8606.028; Wed, 9 Apr 2025
 08:42:51 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Dugast, Francois" <francois.dugast@intel.com>
Subject: RE: [PATCH i-g-t v3 3/5] lib/intel_compute_square_kernel: add loop
 shader binary for PTL
Thread-Topic: [PATCH i-g-t v3 3/5] lib/intel_compute_square_kernel: add loop
 shader binary for PTL
Thread-Index: AQHbqLc4K7cjYaODEkyLwN3v2jLYKbObBTXg
Date: Wed, 9 Apr 2025 08:42:51 +0000
Message-ID: <CH3PR11MB84349D50E1D87FA65E29B9D78DB42@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20250408185045.272673-1-zbigniew.kempczynski@intel.com>
 <20250408185045.272673-4-zbigniew.kempczynski@intel.com>
In-Reply-To: <20250408185045.272673-4-zbigniew.kempczynski@intel.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|CY8PR11MB7082:EE_
x-ms-office365-filtering-correlation-id: 249e5fe7-0835-44c7-0823-08dd7742839b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|10070799003|1800799024|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?utf-8?B?WmdtVlk4K2tLTFNsUFdvL3dFcEF0WUlOYllZVzNnK2ZxUVdRb1BtODM3aUk3?=
 =?utf-8?B?enFYb3pzN1RnWGE3WS9KQVlMV0c1d3VQcDNtcHNYSExqa2ZsKzJmOWUrT2g5?=
 =?utf-8?B?QW1NcS9QVVFOS1VsOTJBcDBOZkQ4dm1VdmhmSlBzOXFNdjR3bE1nL21sbnhG?=
 =?utf-8?B?dE1NTDNKelZTekFvVVg2S3hPRjlteVdOQ20ySnBFN0M3TUhiSURhNnk0b0F3?=
 =?utf-8?B?TE1qMEo5VUNWSGNRelNYNWlVR2FZZXpES1R3MCtOZjRwbGJ1Vit0b1hLQmR6?=
 =?utf-8?B?d0tqTFRjTGQ2YmNWOHM4RGxDWDVvYlJzUkU2bUV2VU5TV2lBZHg0RExmQTRv?=
 =?utf-8?B?bklydEFoWDhkdG91aXV1a2FBYXpOcEkrcWhTcFU5Y1Rld1R6NUNwMGtKWE1l?=
 =?utf-8?B?clZSU05EWGRNakt6RThYbGlHM1lVZWxyais1RUllaTVQejg3VzJ1aTQyeEVh?=
 =?utf-8?B?cFRjWUIxSG9uNlZLMW5pKzRnSlVqaWx0REIwa1cxT0x5TzBWSmJEOUg1VHYr?=
 =?utf-8?B?M1hodXFGVHhLL1dzelNFeGg1MHNETkpoci8xd3lLdUNNS21nd0dKdm1vVFR5?=
 =?utf-8?B?Wm0wQU9CeGFwSDlMa2lzcWV1KzV3azJ1dmo1STJxVEs1SVlUNi9FSW5jb2FV?=
 =?utf-8?B?Y1BHREdsYkdIZW9nTk43ajhQNm1jN3RBbTdCNGpscGdqR3M0SWtVTUtmSE41?=
 =?utf-8?B?c3VzZ3lQWHhDclhha3VZSXZsV2xCYVBjVHB4YjRSdy8yRlh1cXNSSG5wa3B2?=
 =?utf-8?B?VlBtK2trRlFBUVpjNkZDTDd4L2RrNGJ1Ym1qckJ5WDRLUUV5ZWdTUTIxV1NO?=
 =?utf-8?B?UnFOaWROM2sxMk9UOGFXZVp3Ym1TMVNWay80ZDI1NnNtbzRKN1ZQbDJ6M2c4?=
 =?utf-8?B?OURNaFg4K2c4ODRhaUF4ZVBDZDh3L0xVM2RENy9NelZ3b1lpMHpkdGR3bURl?=
 =?utf-8?B?QjJHUEgzaFo3VndXU05GL2FYeFo3ajgxdHBBSmFkN1NVOUQwOThNeGFRMkFh?=
 =?utf-8?B?UG9XS0U5MnkwYUhzWFUrWmUxd0w2ZiswbDMzc1g4RndyTTd3dXBLaHVsSHkv?=
 =?utf-8?B?VmRIN0tGZnNMMHBmVDRQbC9ZSXFVR3R0d00yT0puR3ZyNG9pVE5FTWRvUzRt?=
 =?utf-8?B?cG5ablJWbC80aTFrbXRqb2ZWZkMyS0dDNFVzOHNYTU1nN013VWE5TGJtbDdp?=
 =?utf-8?B?cGI5bWFEVmZIdEk2aXNFMDNSSG5iaEpZTzE0WWtsRDhML0ZMUnV3WGV0R1Ez?=
 =?utf-8?B?NVFHbjhwcGZ1d21taXpSdmpicnlFSHV1ZXhveDRzT2JSaEhSdVRMdHVxeE0z?=
 =?utf-8?B?cEhNdDl1dkRRc3ErVWFkVi9aaUlXdU9Pa3laeEFZZUM5cEpLWlRLSzM3NkE3?=
 =?utf-8?B?c2ZjSU9EbU9QeVJNbEJtNkJXUnh2QWpMcDIrSU5IWGZDQ0pMQnFrMm8wUFNE?=
 =?utf-8?B?RlRJSXhrRGlHb1lDNkl6aTJMY1pQb0lOaXNSaGZpM3V4SjR0NkZWV1dyYXhs?=
 =?utf-8?B?bEtwZGh5RHF4QW9LYjk2VWd3L0ZlQWhKTXhhOHZMREprV2JYSlJDNk03Y0g3?=
 =?utf-8?B?MnZ0Z0RmNDRnSm1UV3JxOGMzSXUrdnR5VVp4anRpWnVXU0lSVnVHd3NDKzI2?=
 =?utf-8?B?MjVCaWFtQWlleU5LeTdTOWV0dWhnbVFGcjRKc0p1ZzNjR2k3QWVrdTIzMXZW?=
 =?utf-8?B?QjlobHExVnIxZWxvSnZJSklFUE40RHZiRk9HYzR5TWFKeUFrWmpRaHM4YXNB?=
 =?utf-8?B?YmgzV3c2TG05ZldvK1ZtQTNHanV6L1QyVVkrVTlnenVUZEZIWGJFRG9vL0hl?=
 =?utf-8?B?V0pxazhuTWdFNUJscEFmemhlNnZiMy9CK2tqOCtnNHhsVllBbHZIbktzOUpt?=
 =?utf-8?B?VFY1YXpuTnVDcEU1aFI5aTY0V3NFTTFuSnczM2NKYlc5WkdDVnIzNXM1Z25Z?=
 =?utf-8?Q?LZ94vYnNJ39qMXI6NAnPhDkIFpEegiEH?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(10070799003)(1800799024)(38070700018)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aGlFNUdzcWx6dmpraGlSQUIzOFAvMzl0aGJJM2RSVmFYaG5MTTNkOURwc2Nu?=
 =?utf-8?B?akxtZEh1KzBMcy9SRVdLU1AwTUpBVXVjMG54MEVwYUR2cmMxdGFESE9YZTVx?=
 =?utf-8?B?dXlOSERWV0JhTmZoM0VFVTFZTGlkRWtIazhWU0ZuRDZsWkU3clMvQmFZUzVI?=
 =?utf-8?B?RWRSakcybm5oSGZnQXFId2M4cm8rWlA5TUR4TFlwcG1nRU1BRS9LU1ZHWklK?=
 =?utf-8?B?NGtjcWZvUFMvV2lMc3JxSW1uRmJjL3VzbEk1VGhUZkowV3lxUFp2M2hqbzNW?=
 =?utf-8?B?VGZMRi9sWGh4WGx4RnFVRHQ5WXBYTTl6Y3FiRDh2ZERvOTBwVElSVEVkQTNi?=
 =?utf-8?B?a2ErL2E4ZFNISVhHVmpTRm8vcWdCQjhjTUVYbGFZMDAzSzZRRTFJdWtSVHFl?=
 =?utf-8?B?aWhJM2FCUVBWMzFyaFFvZTROL25mdUE4SnN2K3FmMHVnNFNnc2h6NDVZYUNi?=
 =?utf-8?B?WmZJeU9BUjBWNWIvNWtrTHl0R2xQcVlTUGxRb3JROEtqSGJWOEtoWm10ekRN?=
 =?utf-8?B?bHpHZlJrZURsdkRveXFhQjdxYmRoY3ZBa1R1bldJOUJFN3hJZFQ4VHNXSlI3?=
 =?utf-8?B?MklrcFBQQ0ErUDVmZEJJOXpGUUNDbnd4QmZQVUY3b3pkY2dMWm16SjhvQm42?=
 =?utf-8?B?TVRNWVBtSVY2YXc4WnBEQzdKRVZCTi8zKzVjUG51QWxBYXJqVkZjK2JqenZw?=
 =?utf-8?B?T1R0K0Q0L2dYVTR0M1NSZjVyWUNpTTNuNm1VVWpzUXlOenRqQUdINkhySllv?=
 =?utf-8?B?UzkvbW4vM1lPYjVzWmdFa2QxZUIyMzJOZGJ1REJwYnltUG1EekJ5dW5EK0Zu?=
 =?utf-8?B?OUNlenRkdE13T2g4VndUUUc4cW5JK1l6NWxnWUFhOTkrNWhTb2Z5d3VGczh5?=
 =?utf-8?B?VlJzNGhkMHRPVkZCY0wxK3NnUEhCR2lUNWtXTU8zdHU0d1hpTXhXUk40VGZX?=
 =?utf-8?B?MHlFeXBzSDV0ckhBY2ZRNTQ4Z2pwb1RnVFJQK2JDNXM5eEUwYy9mMkM3MElh?=
 =?utf-8?B?RUNHdG5WdjVwalhoTW9YMnphUXV1cDVWUHRxVFM3K21QNWJOSTR4N3ZwSGtL?=
 =?utf-8?B?a3N0dGtpU0Jscm9hS3haWU94ZVgveXpXVDdReitEK3NUNi9qTjY0SXRldTl5?=
 =?utf-8?B?NW9TU3hTUkhqTlJlOTZBS0lSTzBobm82b2dqUGZVcldGWkdmTGZpbGlVVzU1?=
 =?utf-8?B?a2tZemNRd1JUaUt4ckVMYWdNMkNFaGlYOXZjTm9JTVFOZG1ZMG1PcnBSalFM?=
 =?utf-8?B?cHFQQ3dHVE9VRzBBQ1lSOW9xblBCZ3hhVDhudzE2Tk8xUmVXb3NaMU14R3pz?=
 =?utf-8?B?RTlIZThob0V3MFEvVUllK2c3NktkR2thSDYvYWR0aWZCeFcyY0NhOGNvcHpF?=
 =?utf-8?B?dG12L0Z0VUFqQ1Nzc0pBMVJ1N2toS0J4ODcwcktZQzROTlM4ODFVUXphR3NI?=
 =?utf-8?B?TVBJdXJ5T2Y2eEVHREROcXJGdHdQRWcvalg2cjhlSzZHbXdRVGQ0ZjRjNmtI?=
 =?utf-8?B?SThjcC9XdUZ3RzdYc3dIUmIyYThPMmRXZS9FaDlpY3F1bnpCY1RyNHZWUm5s?=
 =?utf-8?B?YW5xZ3JrMlN5RXRnOThBUGVtV2NtYWhhVlJjOTQ1TXkrKys1bkFPV09XSmE1?=
 =?utf-8?B?em1PbElaU2JiZHRqQlRBbDQ2dE1CRmdGV3E0d3dJSUx0K1lGSTFWMS93UmpQ?=
 =?utf-8?B?UzdNcXh5NDg3cHZOdlRwcDBLM1dMZG9Sd3R2djdxZ3BoQitBT2N3ZkVHSGl6?=
 =?utf-8?B?cHo4WGIwcUdIUTErNENMclBLZ2FpbThMbG8rVkRXTVg3ZC94N2pGZlZkd0FO?=
 =?utf-8?B?M2RVUUF0NE13TjBaeS9vR29BQ0ZrYXl1Z0lvL1VBRGNDQldtWndjV3JsZlJI?=
 =?utf-8?B?dldkZ2xINFZvdyt6Y1crcGZSeVR6NFVnUGhUMy84TWNhVkhIWTFuK3BUcmU1?=
 =?utf-8?B?SWRvZ2oyZkxIdjVJV2lSTERhQ2JOdUg0VHhVeEIxd0xDU05zOEhJRERtRkhZ?=
 =?utf-8?B?R2twbkRqWWJGOU1jSEE4UEVpNWw3ams4UkZsV0JJeWtzYU5OOE0xOWlid2g0?=
 =?utf-8?B?THRwWnYxZ2JVNGZFeEJ2YkQxVTVHVEkrak5BUjlqcjZHamNDYmxSNW4yRFdI?=
 =?utf-8?B?Z1NqVlBzMnJWNFNBRVBYZ2tHaEhkY0p3WlNMZk5RcGNzK3lvdVgwOFBSb1Vx?=
 =?utf-8?B?VGE4dy9ndTV1dEJKUG9zaytWVDBrQjlFY1ZlS3U2REZDMjQyUnlIWXJmU283?=
 =?utf-8?B?bE9ZMWJOa2J1QUlGNDAxMWNyekVRPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 249e5fe7-0835-44c7-0823-08dd7742839b
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2025 08:42:51.5780 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tJtWawOYJ/aLz/YxE8/OIpkug27QnZbuH6XjsdiI+2Yqt76WhPP+22Qfk7KWP43DoUNgNjRn3MePBoA2swgoOhSktsMrlsI2Cy3jgU0Geek=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7082
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

TEdUTSwNClJldmlld2VkLWJ5OiBQcml5YW5rYSBEYW5kYW11ZGkgPHByaXlhbmthLmRhbmRhbXVk
aUBpbnRlbC5jb20+DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS2Vt
cGN6eW5za2ksIFpiaWduaWV3IDx6Ymlnbmlldy5rZW1wY3p5bnNraUBpbnRlbC5jb20+DQo+IFNl
bnQ6IDA5IEFwcmlsIDIwMjUgMTI6MjEgQU0NCj4gVG86IGlndC1kZXZAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnDQo+IENjOiBLZW1wY3p5bnNraSwgWmJpZ25pZXcgPHpiaWduaWV3LmtlbXBjenluc2tp
QGludGVsLmNvbT47IER1Z2FzdCwNCj4gRnJhbmNvaXMgPGZyYW5jb2lzLmR1Z2FzdEBpbnRlbC5j
b20+OyBEYW5kYW11ZGksIFByaXlhbmthDQo+IDxwcml5YW5rYS5kYW5kYW11ZGlAaW50ZWwuY29t
Pg0KPiBTdWJqZWN0OiBbUEFUQ0ggaS1nLXQgdjMgMy81XSBsaWIvaW50ZWxfY29tcHV0ZV9zcXVh
cmVfa2VybmVsOiBhZGQgbG9vcA0KPiBzaGFkZXIgYmluYXJ5IGZvciBQVEwNCj4gDQo+IFJlcGxh
Y2UgdXNlZCBpbmNyZW1lbnQgc2hhZGVyIHdpdGggbG9vcCB2ZXJzaW9uLg0KPiANCj4gU2lnbmVk
LW9mZi1ieTogWmJpZ25pZXcgS2VtcGN6ecWEc2tpIDx6Ymlnbmlldy5rZW1wY3p5bnNraUBpbnRl
bC5jb20+DQo+IENjOiBGcmFuY29pcyBEdWdhc3QgPGZyYW5jb2lzLmR1Z2FzdEBpbnRlbC5jb20+
DQo+IENjOiBQcml5YW5rYSBEYW5kYW11ZGkgPHByaXlhbmthLmRhbmRhbXVkaUBpbnRlbC5jb20+
DQo+IC0tLQ0KPiAgbGliL2ludGVsX2NvbXB1dGVfc3F1YXJlX2tlcm5lbHMuYyB8IDM2DQo+ICsr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPiAgMSBmaWxlIGNoYW5nZWQsIDM2IGluc2Vy
dGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9saWIvaW50ZWxfY29tcHV0ZV9zcXVhcmVfa2Vy
bmVscy5jDQo+IGIvbGliL2ludGVsX2NvbXB1dGVfc3F1YXJlX2tlcm5lbHMuYw0KPiBpbmRleCA2
MjZkYmM0Y2VjLi5mNjdjMDQ4NTgzIDEwMDY0NA0KPiAtLS0gYS9saWIvaW50ZWxfY29tcHV0ZV9z
cXVhcmVfa2VybmVscy5jDQo+ICsrKyBiL2xpYi9pbnRlbF9jb21wdXRlX3NxdWFyZV9rZXJuZWxz
LmMNCj4gQEAgLTM4ODEsNiArMzg4MSw0MCBAQCBzdGF0aWMgY29uc3QgdW5zaWduZWQgY2hhcg0K
PiB4ZTJscGdfa2VybmVsX2xvb3BfYmluW10gPSB7DQo+ICAJMHgwMCwgMHgwMCwgMHgwMCwgMHgw
MCwgMHgwMCwgMHgwMCwgMHgwMCwgMHgwMCAgfTsNCj4gDQo+ICtzdGF0aWMgY29uc3QgdW5zaWdu
ZWQgY2hhciB4ZTNscGdfa2VybmVsX2xvb3BfYmluW10gPSB7DQo+ICsJMHg2NSwgMHgwMCwgMHgw
MCwgMHg4MCwgMHgyMCwgMHg4MiwgMHgwNSwgMHg3ZiwgMHgwNCwgMHgwMCwgMHgwMCwgMHgwMiwN
Cj4gKwkweGMwLCAweGZmLCAweGZmLCAweGZmLCAweDQwLCAweDE5LCAweDAwLCAweDgwLCAweDIw
LCAweDgyLCAweDA1LCAweDdmLA0KPiArCTB4MDQsIDB4N2YsIDB4MDAsIDB4MDIsIDB4MDAsIDB4
MDAsIDB4MDAsIDB4MDAsIDB4MzEsIDB4MjAsIDB4MDMsIDB4ODAsDQo+ICsJMHgwMCwgMHgwMCwg
MHgwYywgMHgwMiwgMHg4ZiwgMHg3ZiwgMHgwMCwgMHhmYSwgMHgwMywgMHgwMCwgMHg3MCwgMHhm
NiwNCj4gKwkweDYxLCAweDAwLCAweDEwLCAweDJjLCAweDAxLCAweDAwLCAweDEwLCAweDAwLCAw
eDAxLCAweDAwLCAweDAwLCAweDgwLA0KPiArCTB4MDAsIDB4MDAsIDB4MDEsIDB4MDAsIDB4MDAs
IDB4MDAsIDB4MDAsIDB4MjAsIDB4MDAsIDB4MDAsIDB4MDAsIDB4MDAsDQo+ICsJMHgwMSwgMHgw
MCwgMHgwMCwgMHg4MCwgMHgwMCwgMHgwMCwgMHgwMSwgMHgwMCwgMHgwMCwgMHgwMCwgMHgwMCwg
MHgzMCwNCj4gKwkweDAwLCAweDAwLCAweDAwLCAweDAwLCAweDY2LCAweDA5LCAweDAwLCAweDgw
LCAweDIwLCAweDgyLCAweDAxLCAweDgwLA0KPiArCTB4MDAsIDB4ODAsIDB4MDAsIDB4MDIsIDB4
YzAsIDB4MDQsIDB4MDAsIDB4NDAsIDB4MDEsIDB4MDksIDB4OGMsIDB4M2MsDQo+ICsJMHgwMCwg
MHgwMCwgMHgxMCwgMHgwMCwgMHg2MSwgMHgwMCwgMHg4NCwgMHhhNCwgMHgwNCwgMHgwMiwgMHgx
MCwgMHgwMCwNCj4gKwkweDMxLCAweDIwLCAweDAzLCAweDgwLCAweDAwLCAweDAwLCAweDBjLCAw
eDAzLCAweDBjLCAweDA0LCAweDAwLCAweGZiLA0KPiArCTB4MDAsIDB4MDAsIDB4YTAsIDB4MDAs
IDB4NzAsIDB4ODAsIDB4MTQsIDB4ODAsIDB4NjAsIDB4ODYsIDB4MDEsIDB4MDAsDQo+ICsJMHgw
NCwgMHgwMywgMHgwMCwgMHgxNiwgMHgzNCwgMHgxMiwgMHgzNCwgMHgxMiwgMHgyMCwgMHgwMCwg
MHgwMCwgMHg5NCwNCj4gKwkweDAwLCAweDQwLCAweDAwLCAweDAwLCAweDAwLCAweDAwLCAweDAw
LCAweDAwLCAweGQ4LCAweGZmLCAweGZmLCAweGZmLA0KPiArCTB4NjEsIDB4MWQsIDB4MTAsIDB4
MjgsIDB4N2YsIDB4MDEsIDB4MTAsIDB4MDAsIDB4MzEsIDB4MjAsIDB4MDIsIDB4ODAsDQo+ICsJ
MHgwNCwgMHgwMCwgMHgwMCwgMHgwMCwgMHgwYywgMHg3ZiwgMHgyMCwgMHgzMCwgMHgwMCwgMHgw
MCwgMHgwMCwgMHgwMCwNCj4gKwkweDAwLCAweDAwLCAweDAwLCAweDAwLCAweDAwLCAweDAwLCAw
eDAwLCAweDAwLCAweDAwLCAweDAwLCAweDAwLCAweDAwLA0KPiArCTB4MDAsIDB4MDAsIDB4MDAs
IDB4MDAsIDB4MDAsIDB4MDAsIDB4MDAsIDB4MDAsIDB4MDAsIDB4MDAsIDB4MDAsIDB4MDAsDQo+
ICsJMHgwMCwgMHgwMCwgMHgwMCwgMHgwMCwgMHgwMCwgMHgwMCwgMHgwMCwgMHgwMCwgMHgwMCwg
MHgwMCwgMHgwMCwgMHgwMCwNCj4gKwkweDAwLCAweDAwLCAweDAwLCAweDAwLCAweDAwLCAweDAw
LCAweDAwLCAweDAwLCAweDAwLCAweDAwLCAweDAwLCAweDAwLA0KPiArCTB4MDAsIDB4MDAsIDB4
MDAsIDB4MDAsIDB4MDAsIDB4MDAsIDB4MDAsIDB4MDAsIDB4MDAsIDB4MDAsIDB4MDAsIDB4MDAs
DQo+ICsJMHgwMCwgMHgwMCwgMHgwMCwgMHgwMCwgMHgwMCwgMHgwMCwgMHgwMCwgMHgwMCwgMHgw
MCwgMHgwMCwgMHgwMCwgMHgwMCwNCj4gKwkweDAwLCAweDAwLCAweDAwLCAweDAwLCAweDAwLCAw
eDAwLCAweDAwLCAweDAwLCAweDAwLCAweDAwLCAweDAwLCAweDAwLA0KPiArCTB4MDAsIDB4MDAs
IDB4MDAsIDB4MDAsIDB4MDAsIDB4MDAsIDB4MDAsIDB4MDAsIDB4MDAsIDB4MDAsIDB4MDAsIDB4
MDAsDQo+ICsJMHgwMCwgMHgwMCwgMHgwMCwgMHgwMCwgMHgwMCwgMHgwMCwgMHgwMCwgMHgwMCwg
MHgwMCwgMHgwMCwgMHgwMCwgMHgwMCwNCj4gKwkweDAwLCAweDAwLCAweDAwLCAweDAwLCAweDAw
LCAweDAwLCAweDAwLCAweDAwLCAweDAwLCAweDAwLCAweDAwLCAweDAwLA0KPiArCTB4MDAsIDB4
MDAsIDB4MDAsIDB4MDAsIDB4MDAsIDB4MDAsIDB4MDAsIDB4MDAsIDB4MDAsIDB4MDAsIDB4MDAs
IDB4MDAsDQo+ICsJMHgwMCwgMHgwMCwgMHgwMCwgMHgwMCwgMHgwMCwgMHgwMCwgMHgwMCwgMHgw
MCwgMHgwMCwgMHgwMCwgMHgwMCwgMHgwMCwNCj4gKwkweDAwLCAweDAwLCAweDAwLCAweDAwLCAw
eDAwLCAweDAwLCAweDAwLCAweDAwLCAweDAwLCAweDAwLCAweDAwLCAweDAwLA0KPiArCTB4MDAs
IDB4MDAsIDB4MDAsIDB4MDAsIDB4MDEsIDB4MDksIDB4MDAsIDB4ODAsIDB4MDAsIDB4MDAsIDB4
MDEsIDB4MDAsDQo+ICsJMHgwMCwgMHgwMCwgMHgwMCwgMHgwMCwgMHgwMCwgMHgwMCwgMHgwMCwg
MHgwMCB9Ow0KPiArDQo+ICB1bnNpZ25lZCBjaGFyIHhlbHBnX2tlcm5lbF9zcXVhcmVfYmluW10g
PSB7DQo+ICAJMHg2MSwgMHgwMCwgMHgwMywgMHg4MCwgMHgyMCwgMHg0MiwgMHgwNSwgMHg3Ziwg
MHgwMCwgMHgwMCwgMHgwMCwgMHgwMCwNCj4gIAkweDAwLCAweDAwLCAweDAwLCAweDAwLCAweDY1
LCAweDAwLCAweDAwLCAweDgwLCAweDIwLCAweDgyLCAweDQ1LCAweDdmLA0KPiBAQCAtNjY4OCw2
ICs2NzIyLDggQEAgY29uc3Qgc3RydWN0IGludGVsX2NvbXB1dGVfa2VybmVscw0KPiBpbnRlbF9j
b21wdXRlX3NxdWFyZV9rZXJuZWxzW10gPSB7DQo+ICAJCS5sb25nX2tlcm5lbF9zaXplID0gc2l6
ZW9mKHhlM2xwZ19rZXJuZWxfaW5jX2JpbiksDQo+ICAJCS5zaXBfa2VybmVsID0geGUzbHBnX2tl
cm5lbF9zaXBfYmluLA0KPiAgCQkuc2lwX2tlcm5lbF9zaXplID0gc2l6ZW9mKHhlM2xwZ19rZXJu
ZWxfc2lwX2JpbiksDQo+ICsJCS5sb29wX2tlcm5lbCA9IHhlM2xwZ19rZXJuZWxfbG9vcF9iaW4s
DQo+ICsJCS5sb29wX2tlcm5lbF9zaXplID0gc2l6ZW9mKHhlM2xwZ19rZXJuZWxfbG9vcF9iaW4p
LA0KPiAgCX0sDQo+ICAJe30NCj4gIH07DQo+IC0tDQo+IDIuMzQuMQ0KDQo=
