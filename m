Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 221DBAFB84
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Aug 2022 04:42:34 +0000 (UTC)
Message-ID: <2fbe57a3-4d16-7333-5e56-5c2467b37d60@intel.com>
Date: Wed, 10 Aug 2022 10:12:16 +0530
Content-Language: en-US
To: Ananya Sharma <ananya.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20220805050815.820130-1-ananya.sharma@intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20220805050815.820130-1-ananya.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v2 0/2] IGT clean-up tasks
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

Hi Ananya,

I have dropped few comments in both patches of this series, please 
address those comments.

Also, I can recommend to change the order of these patches as
Dynamic-subtets followed by Cleanup.

- Bhanu

On Fri-05-08-2022 10:38 am, Ananya Sharma wrote:
>   tests/kms_universal_plane.c | 91 +++++++++++++++++++++----------------
>   1 file changed, 51 insertions(+), 40 deletions(-)
> 
