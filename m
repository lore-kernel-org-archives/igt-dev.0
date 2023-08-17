Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2072.outbound.protection.outlook.com [40.107.220.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04BE510E1AF
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Aug 2023 07:09:52 +0000 (UTC)
Message-ID: <5cd3fc34-f6c7-21ff-f710-cb3f543fcb80@amd.com>
Date: Thu, 17 Aug 2023 01:09:44 -0600
To: Maxime Ripard <maxime@cerno.tech>
References: <20230816205316.867195-1-alex.hung@amd.com>
 <20230816205316.867195-3-alex.hung@amd.com>
 <5zt2ctyod27qaw7sld4ejvvemgxm6chh4dtf7cnjiil2rizksm@bfiezcb3zo3q>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <5zt2ctyod27qaw7sld4ejvvemgxm6chh4dtf7cnjiil2rizksm@bfiezcb3zo3q>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH 3/3] tests/kms_writeback: support
 DRM_FORMAT_XRGB2101010 for writeback
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, brian.starkey@arm.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



On 2023-08-17 00:32, Maxime Ripard wrote:
> Hi,
> 
> On Wed, Aug 16, 2023 at 02:53:16PM -0600, Alex Hung wrote:
>> Allow kms_writeback to run with DRM_FORMAT_XRGB8888 if supported
>> or to try DRM_FORMAT_XRGB2101010 if DRM_FORMAT_XRGB8888 is not
>> available.
> 
> XRGB8888 is always supposed to be available, if it's not, it's a driver
> issue. Which means that XRGB2101010 will never actually be tested.

It is up to a device driver to support specific format(s), not necessary 
an issue. At least for now amdgpu won't support XRGB8888 but XRGB2101010.

> 
> I think we should make a proper test for that format, instead of a
> (silent) fallback?

Not sure what's the proper test or the fallback you are referring to. 
The intention here is to test XRGB2101010 when possible without breaking 
the original behaviours for XRGB8888.

Changing kms_writeback to tests multiple formats requires significant 
modifications and tests which requires a driver capable of multiple 
formats in the first place. Once we or anyone have such supports we can 
come back to rework kms_writeback.

> 
> Maxime
