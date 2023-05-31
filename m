Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBE7510E1B5
 for <igt-dev@lists.freedesktop.org>; Wed, 31 May 2023 06:52:21 +0000 (UTC)
Date: Wed, 31 May 2023 08:52:13 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: "Sharma, Swati2" <swati2.sharma@intel.com>
Message-ID: <20230531085213.4f86f261@maurocar-mobl2>
In-Reply-To: <ab16d720-902e-8ab8-fd16-88173780a1f7@intel.com>
References: <20230529052835.860047-1-bhanuprakash.modem@intel.com>
 <ab16d720-902e-8ab8-fd16-88173780a1f7@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [i-g-t V4 00/82] Document KMS tests
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

On Tue, 30 May 2023 20:30:08 +0530
"Sharma, Swati2" <swati2.sharma@intel.com> wrote:

> Hi Bhanu,
> 
> IMO, functionality and mega feature seems to be redundant
> + * Functionality: vrr
> + * Mega feature: VRR
> 
> Any thoughts?

They're not identical. See, for instance, General Display Features
mega feature. It contains several different functionalities: crc, cursor,
force_connector, hotplug... This is on the patches that were already 
merged.

The idea is that mega feature will contain a top level group of features,
while functionality will contain the more technical low-level one.

> Mauro/Bhanu,
> What are our plans for igt_decribe(). It seems desriptions and 
> igt_describe() is unneeded.

Yes. It is on our todo list to remove igt_describe(), igt_describe_f()
and IGT_TEST_DESCRIPTION() from the files that are documented via
C comments.

Regards,
Mauro
