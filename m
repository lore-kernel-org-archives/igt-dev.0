Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DA4310E224
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Jun 2023 11:09:48 +0000 (UTC)
Message-ID: <ae67320b-5871-baba-6a1c-90c888303462@intel.com>
Date: Thu, 1 Jun 2023 16:39:14 +0530
Content-Language: en-US
To: "Hogander, Jouni" <jouni.hogander@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
References: <20230601050928.2487611-1-kunal1.joshi@intel.com>
 <20230601050928.2487611-4-kunal1.joshi@intel.com>
 <8c8f99e86bfd03f388491d9cd71f452cfc1b8e78.camel@intel.com>
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
In-Reply-To: <8c8f99e86bfd03f388491d9cd71f452cfc1b8e78.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 3/6] RFC
 tests/i915/kms_frontbuffer_tracking: xe doesn't support tiling as of now
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>


On 6/1/2023 4:12 PM, Hogander, Jouni wrote:
> On Thu, 2023-06-01 at 10:39 +0530, Kunal Joshi wrote:
>> XE doesn't support tiling as of now, so set tiling to linear
> Maybe this should be taken into account in opt_handler as well? I.e.
> Trying to use tiling other than liner for Xe should result error.
Hello Jouni,

This will be over written in setup_drm where we set tiling to linear if xe,
To handle this in opt_handler we will need to open ,close fd,
can i have debug print stating opt.tiling parameter is overridden as XE 
supports onlylinear tiling,
how do you see it?


Thanks and Regards
Kunal Joshi
