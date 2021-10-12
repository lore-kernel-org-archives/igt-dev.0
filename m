Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96EAD89DFD
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Oct 2021 13:48:22 +0000 (UTC)
References: <20211011071555.1069239-1-priyanka.dandamudi@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
Message-ID: <2da5a0ad-3bb2-cda8-1af1-2b5e6a6365e6@intel.com>
Date: Tue, 12 Oct 2021 14:19:54 +0100
MIME-Version: 1.0
In-Reply-To: <20211011071555.1069239-1-priyanka.dandamudi@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915: use
 gem_require_mmap_device_coherent
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: priyanka.dandamudi@intel.com, igt-dev@lists.freedesktop.org, arjun.melkaveri@intel.com, ashutosh.dixit@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

On 11/10/2021 08:15, priyanka.dandamudi@intel.com wrote:
> From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> 
> Update gem_require_mmap_wc to gem_require_mmap_device_coherent
> along with mmap__wc, as it works on discrete platforms, while
> still using an explicit WC mmap on integrated platforms.
> Below are the updated tests:
> gem_exec_schedule
> gem_exec_async
> gem_busy
> kms_busy
> 
> Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
