Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1405110E166
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Oct 2023 12:12:12 +0000 (UTC)
Message-ID: <d51813fd-762a-62a4-aa46-f499a41bf3cb@intel.com>
Date: Thu, 5 Oct 2023 17:41:50 +0530
Content-Language: en-US
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20230928155604.546419-1-swati2.sharma@intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20230928155604.546419-1-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [v2 0/2] tests/kms_universal_plane: Dynamic conversion
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

Hi Swati,

On Thu-28-09-2023 09:26 pm, Swati Sharma wrote:
> Convert subtests to dynamic subtests and update documentation
> accordingly.
> 
> Swati Sharma (2):
>    tests/kms_universal_plane: convert subtests to dynamic subtests
>    tests/kms_universal_plane: update testplan doc

You need to combine these two patches, otherwise it'll break the 'git 
bisect'.

- Bhanu

> 
>   tests/kms_universal_plane.c | 150 ++++++++----------------------------
>   1 file changed, 34 insertions(+), 116 deletions(-)
> 
