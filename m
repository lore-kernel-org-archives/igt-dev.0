Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DCF010EB4A
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Jan 2024 17:47:40 +0000 (UTC)
Message-ID: <be6f28ac-1ebf-4b2a-8b03-5adcf0da0fc0@intel.com>
Date: Fri, 12 Jan 2024 17:47:36 +0000
MIME-Version: 1.0
Subject: Re: [PATCH i-g-t 1/1] tests/intel/xe_ccs: fix block-multicopy-inplace
 subtest
To: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
References: <cover.1705103321.git.akshata.jahagirdar@intel.com>
 <1ffebacea9673a0c143e535bd0b5fe9ff8c65e9d.1705103321.git.akshata.jahagirdar@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <1ffebacea9673a0c143e535bd0b5fe9ff8c65e9d.1705103321.git.akshata.jahagirdar@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 12/01/2024 23:54, Akshata Jahagirdar wrote:
> Passing correct pat_index based on compression and graphics version,
> fixes the "block-multicopy-inplace" subtest of xe_ccs.
> 
> Signed-off-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
