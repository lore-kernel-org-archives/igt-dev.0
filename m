Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0861C87FD6
	for <igt-dev@archiver.kernel.org>; Thu, 29 Aug 2024 19:50:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A44C410E728;
	Thu, 29 Aug 2024 19:50:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oDdbQwnv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16A3D10E728
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Aug 2024 19:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724961026; x=1756497026;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=BvYH4caJxC9clK49SFN4faBH4nwjv0fP9orQcBdT1GA=;
 b=oDdbQwnvMesa0xd0WbIlfbk7zrTaZYFXtruCl6yL0y8bpkZM8ymgOHk6
 wtWfNX0dV0/Ujwm+0eMKRuL5mak2lCBKWTK1HeiepdG9dVQ9vxL5fkxJq
 cOG9oPTNbri2JoBqGEFCRqB2oewQvyqjSBPNe6yyvvuZhI2GZDmajEmbh
 GlMF7eVtzoy7spPDvNOnNqNafUPscTF6tke32b1m5d21WgfdS4B9ekd+Q
 mHaTzq5oyGXOyHQ9K/YNVayh5Z6wVrvqeSSOYi2zK3zXhfYRtzYgFicXG
 H2lNweJXBk1vobOkVzUCl8ufHl5+Psx+U5n3AwkTYebMxNVtsXbvGtfue Q==;
X-CSE-ConnectionGUID: f2EuMCZGT3+k3s76jGHY2A==
X-CSE-MsgGUID: ET89FWJeRTa7BkHxDzMfKQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="23535787"
X-IronPort-AV: E=Sophos;i="6.10,186,1719903600"; d="scan'208";a="23535787"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2024 12:50:26 -0700
X-CSE-ConnectionGUID: NPd54XA7Sg2Kcwb9Y6710Q==
X-CSE-MsgGUID: QLdctfseRZW73xkzMKJfBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,186,1719903600"; d="scan'208";a="68474412"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Aug 2024 12:50:27 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 29 Aug 2024 12:50:25 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 29 Aug 2024 12:50:24 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 29 Aug 2024 12:50:24 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.43) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 29 Aug 2024 12:50:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WtTCTuszyU2nDnVxPxa1TQFq0cepedOj+v5zqxEsGqTTFJfH25JAPowN+RXM55CYWiC+t6oBs5CAXNz4orW+J2WG7luvmjZ/HgLlioPbhgq7r/7UKVGiyr8WreUeaYZiATb9DLdg6J2Ylf9c7gF3u3e2eqdx0g3zbwlyUNflzQIxdjXES4lurEZHo6jQmy4UW4mROo6v8CjDn8TOXvJyssBihI5wzHwyxSFrBuJhDZUBgz8wY0+klJAYv4V8gChWgn4KwjuZzmzxsksUcBBM/SVhx2JBxNWFnavEvjH/ow+44r3EIM2kmbaXtQWgcs9Y0z5VsAU/Kfh9jNcI8tR4GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BvYH4caJxC9clK49SFN4faBH4nwjv0fP9orQcBdT1GA=;
 b=lRcw999ClytdFKDpbBht564DV/as4oCdTWXaRe6GEkaiKB/+5KysFRPmRJYL+WAwRY8iLPRBlSFWdGC+ZxNhEzqiKXmKlSK7vuUwt4fsNaAXuIXPlRr0cNLWt8V6mIAHKau1WL6dESJcrVN9heDV8oJ2sclcWSCv60Hm7tuFqcqLmLcIrIlm5g639Ut4BbE2WyazgVLZOnEmBY9gG1lAiOk94l6rM3qYrrqpax3RmhvmW2b50A46N+BcUPS/X09AY08TK36xCI+3P1BvHLhqiviBI+eaMSVBuXdoXUXwMPaxTfkdA9SUIQCpLH30s0jd5q67DXeBYTyFIzRAupoBoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CO1PR11MB5011.namprd11.prod.outlook.com (2603:10b6:303:6d::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.28; Thu, 29 Aug
 2024 19:50:22 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7897.021; Thu, 29 Aug 2024
 19:50:22 +0000
Date: Thu, 29 Aug 2024 14:50:19 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Sharma, Swati2" <swati2.sharma@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t v2] tests/kms_rmfb: Fix subtest description
Message-ID: <r4scqu2z634pbhu3seqabldfii3jukw2dkmdkyaxn35n7o2j2h@tduilwldwsck>
References: <20240201004448.351926-1-lucas.demarchi@intel.com>
 <d382978a-5b50-4afc-9e99-3350bef08576@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <d382978a-5b50-4afc-9e99-3350bef08576@intel.com>
X-ClientProxiedBy: MW4PR03CA0052.namprd03.prod.outlook.com
 (2603:10b6:303:8e::27) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CO1PR11MB5011:EE_
X-MS-Office365-Filtering-Correlation-Id: 29581f56-6660-4cbd-2696-08dcc863d17a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|27256017;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cVF/J8MiFA3OM6s18MeSka/xeCVEef/rv2MTAkkh//7WMRnMN319e4r9GOAc?=
 =?us-ascii?Q?keyM8shTtVlifFuIzWE3iceU61gNRJQeqCJFCSXG2QpR45oD4g2goZT8fGDc?=
 =?us-ascii?Q?KsuY++WgD4c2h4namY8XIOodrUb7AnQMN3zfTQnEI7pk7ECn7Cg31gQ++7hX?=
 =?us-ascii?Q?W3iHA/iAwCCYHLJhRgUKlmyDjMEGtdRP2SXAgOevLtRfg2v0cQrIlopYOeiB?=
 =?us-ascii?Q?yqzK9shYjkSlVX9EurKEKJW6vU2m1rnnnCuunmjq7k31cPkM1RKj91bBtZh4?=
 =?us-ascii?Q?1CIW2B1DY9VWXdVyjTAkNx0kYHcDnJYs4ZCePrUKDbxe70XpjcffIYTHb5ZD?=
 =?us-ascii?Q?Fp1jaozFyrUoZCjQ8acoUzjd34TW/kSKUZBmCg6uN7gXbXhm7JVMDzdHc5Bw?=
 =?us-ascii?Q?CmqkUPXg98Q4VwFc8gSYnTpA2GSGefJp3FlMGSzX03fDaF/gEFG6uRiWtOyI?=
 =?us-ascii?Q?m6NRZAhO/zZgNM7m3xSWT5QUNi7CGW2LPaWjShRIod1Fa2TTTjtCeCYSCvpN?=
 =?us-ascii?Q?WabWrhoc8030EAhxV36isW3etF/foQgpHMH91DQNzYGIasXycsj5VzFfWrLR?=
 =?us-ascii?Q?muU274ng83j3skAG3qlV1SZVEnvHP3VpQmDKsbu56gX7RA/F8jSMnxgYeHcY?=
 =?us-ascii?Q?DsmSikKnMF5TGCFE8fiFE3mBkyD81Pwsz48psuMkSH6cv7/9U2k/6c7Vgg4h?=
 =?us-ascii?Q?bRtsZgtbB+S6OPe4sF6okIUcZeUypPi9C4Cx3AZ1tWWZjbeaxkF1fAA1H62L?=
 =?us-ascii?Q?5mVmBzH4bAD+9r/PJmVYlotJMc3Dvqp1GmnwuBBC2PEK/lKtyRZcHOLanwRH?=
 =?us-ascii?Q?zHTytCcDMYM0/GmrWNZQGoNVonpl+7XgUH99vhd6DjOxnM1XOB4IT+Z9tVpd?=
 =?us-ascii?Q?BdmLGPXenCdRwEQV9AjTih64SjokHXN+Dn6ZFt4rey3sNghjZ6vEQImReSlg?=
 =?us-ascii?Q?2jRZ25R/eLjcBr13nrnvbowd5ste73rwDH+VlrrEAPJVHZtbuoUJ9Ildg+dC?=
 =?us-ascii?Q?j0GpedLCLyZ6fFZJY3qXfelm5exFIFL64GJT5hWMZ9wOCRJLXvyU2+0ATAsL?=
 =?us-ascii?Q?SFppDhluDm2rwL4y/ZzwHEUujC6dCXo8uV9mu2bnYj2XHHtb5HmjFcKrJVoO?=
 =?us-ascii?Q?s42wxrRYKfS5UtiKPo0XVJjDURNjNhbiKwn4u4aHbpGyGUenLrK1i8Hp8Ejb?=
 =?us-ascii?Q?RhR3uPfT99/ZmFk5DcUTJwGcZRnURKvFhJhRNR/ZdP1IMvbaZpiCY6fZ2eTE?=
 =?us-ascii?Q?c4m91nTgkzCx9jhGS8EgHv1KD1JuAyuYRrCy3Sf2VoKuCCUfpB0K0hiDrCeR?=
 =?us-ascii?Q?nJmxxTUvNFWs/X3R4h9hFAqoJSq+L2xEbLFmVM3iAfxrsN3lrR6BIwhGi/mU?=
 =?us-ascii?Q?He8QW8krLAtCEkm/LIxeUgQ5H82jMyvpWdrYPrnSBhjQri6yVg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(27256017); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gDZ3AqzO48EvPzXgD62qUF0Onq1u4uMYUxPYSSoeTkSd1oFsIeJwtciFZFAt?=
 =?us-ascii?Q?vuVWmPHa5DSvhXv8PB3YZyVJ4g33qMsslaOqMAcezAcFVcuLWtvoT80Sznj6?=
 =?us-ascii?Q?tiqanjfbJKBx+g2+bz2T2IyEM2bX5JKxUz1Ahqgis/40lUnvT2Z7NwAvHJtT?=
 =?us-ascii?Q?RE7OvSlk9uRj5uJNi+rIYXQFpo16avRIUahYdWtaADfaeB1qAuKbi4LbLD0q?=
 =?us-ascii?Q?bLr1w2owcT672XeFyYRyFvwhHIPpWCJvzUIv2O/+uQoxuJJ488/az9iohYEE?=
 =?us-ascii?Q?iJczg1frnuAUeXF4Wf61FWpYDWXz62iqqob8Kk09zgXoprfeFg0w2esqjSvc?=
 =?us-ascii?Q?8lUDJRDzTwpxHix9NYZCbQBBG4m7e9iuLDCY3a+kKU20TuV1TMiASUrCZuSW?=
 =?us-ascii?Q?gZiTKNZQHyLY9gVlaqxYOlgc4RnqdkXnUMNSUmDnqy651z5EmkEj4WMESU1z?=
 =?us-ascii?Q?MxNV+vg2OTS1UnwAlDsKl65yAEnkizf0n75G8D27jQxwufeidToNgwJQ/lAn?=
 =?us-ascii?Q?qIufBCW2txnvwshQUoqz0KYX5fKOsciR/2v21hfH6M9nWY/ZYHVgKNVoH2YN?=
 =?us-ascii?Q?wiufwp8e4dY7JBIiLFpZMWWGnJs4G6HZiPSkPBZu7CaEWPAzKgpjgwJ+kxQm?=
 =?us-ascii?Q?byiVzeTqOTtL3rbMzzKKYUzI9kGuto0ZAKSd+y1gXx1vsKWWIHYoXLLF70e2?=
 =?us-ascii?Q?tdfnkLo9brmmAXsF7IgZnK8pwVwFSh9KvtGLgbxn+YIpTCx9rfgD1Py+Szub?=
 =?us-ascii?Q?rBxI6/nTrKBtmz2Uk8fis1bk3nzDfPGK4urJ2Upkxk54A05wGjBJehawoQ84?=
 =?us-ascii?Q?QdGMC+tm6po61KFifaIHky+BRbu4fYDIY87KMgeSl1TwK1VXqfXWzj0j1oCu?=
 =?us-ascii?Q?yajr7VNrWq9tfBfixB0NDeuf3xoC/TkUYLBiqASMn5FYgZU7yISC8yk39kqc?=
 =?us-ascii?Q?CNPo2yHsTDQhNkdikCIlvzL4nB+7nuAO2k5Rxeow/J4DUv1t2iZO7DvZR8lR?=
 =?us-ascii?Q?7oVsPKk3rhF+NT8S19KG0nhZqhsUVkGBwAx9ghAwPZhSsiZvhnNqksqEgbXs?=
 =?us-ascii?Q?XmlrWXcBT8AJRlFMS2/yVaID2B2CgRRpBpzYpR3IMXaCPnwUXvtooC6qphlk?=
 =?us-ascii?Q?vCBLlMLgUsmlPPVL+7senvIZ2vKrqylroAMqsj+fs6o4R3gvqwT/G0SbMArU?=
 =?us-ascii?Q?e2IJVi1KqFlO1bJUTAwor8DuWUz/kddw/uizpvWvw75LGGj2iQe9SP18mKl2?=
 =?us-ascii?Q?z8f1qBFW/Zw838HCLDs5msZPCBs+hd4JBwyrQ8IeHd+NdllNuBX1TWCYB1Tw?=
 =?us-ascii?Q?zOOjfiUQD/OwDLCePbn5ZYcKxLvwg4BSreW6stxFagVc1z254/qBUFg5xxTj?=
 =?us-ascii?Q?vPvOqJRVf7pxUlpzYtA9G+vrYDumywHrmahmDW6Lrw2oI05D5RRPVSZLt6yS?=
 =?us-ascii?Q?x+7HHahlruseCDu7h/j23/1a79CBjfzJVwueFpyB01oGBUqcXqAS0V6uRRSe?=
 =?us-ascii?Q?umxWawelm0BXkX97t3i2G/g6HT3fueRmmIiuUmyoGlNrT64w7VKoY9BxWHPK?=
 =?us-ascii?Q?xK0HCMZ12VNFWz/lIsumy2BiPISvGy1Ox+RWrOr/q8MqmLh07zmPboDwxOIM?=
 =?us-ascii?Q?Xw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 29581f56-6660-4cbd-2696-08dcc863d17a
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 19:50:22.2543 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kSnQWYlYZln6enRmYgBeKkRkdlDoumaU7PspenRkEFhBNL1o8fuR9PKyNZkvXZCmxY+Djvwnx29FyhzTVB9wZ4oVFFz+YGoumDGCtcYDavs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5011
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

On Fri, Aug 30, 2024 at 01:03:41AM GMT, Sharma, Swati2 wrote:
>LGTM
>
>Reviewed-by: Swati Sharma <swati2.sharma@intel.com>

thanks, applied.

Lucas De Marchi
