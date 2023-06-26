Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 302AF10E0B7
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Jun 2023 10:42:04 +0000 (UTC)
Message-ID: <49e89ce1-b1b0-b034-aff0-fd5f707043bb@intel.com>
Date: Mon, 26 Jun 2023 16:11:32 +0530
MIME-Version: 1.0
Content-Language: en-US
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20230619085800.1994271-2-bhanuprakash.modem@intel.com>
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
In-Reply-To: <20230619085800.1994271-2-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [i-g-t,
 1/2] tests/kms_cursor_legacy: Add Spin support for XE
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


On 6/19/2023 2:27 PM, Bhanuprakash Modem wrote:
> To support the SPIN tests for XE, just need to fix the allocator
> handle, since the same spin apis works for both i915 & XE.
>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> Acked-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>
