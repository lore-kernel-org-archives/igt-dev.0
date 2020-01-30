Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5A2E6E90E
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Jan 2020 21:29:23 +0000 (UTC)
References: <20200130211748.629-1-antonio.argenziano@intel.com>
 <158041953199.2430.10960787414167851154@skylake-alporthouse-com>
From: Antonio Argenziano <antonio.argenziano@intel.com>
Message-ID: <09f8cca0-d245-02d4-bc70-d514beee251f@intel.com>
Date: Thu, 30 Jan 2020 13:29:23 -0800
MIME-Version: 1.0
In-Reply-To: <158041953199.2430.10960787414167851154@skylake-alporthouse-com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915/gem_concurrent_all: Skip GTT
 mapping when aperture not available
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>



On 30/01/20 13:25, Chris Wilson wrote:
> Quoting Antonio Argenziano (2020-01-30 21:17:48)
>> The test iterates over several mappings and BOs creation options, when
>> GTT mapping is not available skip those options.
> 
> The million-dollar question is "did I already add wc paths?"

I saw at least one wc mode and one wc pipeline so assumed it was ok :).

Antonio

> -Chris
> 
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
